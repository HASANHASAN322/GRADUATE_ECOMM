import 'package:e_comm/data/repositories/auth/auth_repository.dart';
import 'package:e_comm/features/authentication/screens/login/login.dart';
import 'package:e_comm/features/personalization/models/user_model.dart';
import 'package:e_comm/features/personalization/screens/profile/widgets/re_auth_user_login_form.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/widgets/loader/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/network_connection/network_connection.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final hidePass = true.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          /// convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          /// MAP data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              userName: username,
              email: userCredentials.user!.email ?? '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');

          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(
          title: 'Something wrong',
          message:
              'SomeThing went wrong while saving your information. You can re-save your data in your profile.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSize.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete account ? ',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSize.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  void deleteUserAccount() async {
    try {
      /// start loading
      TFullScreenLoader.openLoadingDialog(
          'processing...', 'assets/images/lottie/loading.json');

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        /// re verify
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }

  Future<void> reAuthEmailAndPasswordUser() async {
    try {
      /// start loading
      TFullScreenLoader.openLoadingDialog(
          'processing...', 'assets/images/lottie/loading.json');

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// validation
      if (!reAuthFormKey.currentState!.validate()) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticationWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;

        /// upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);

        /// update user image
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;

        user.refresh() ;
        /// success message
        TLoaders.successSnackBar(
            title: 'Congratulation',
            message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}

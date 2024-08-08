import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:e_comm/data/repositories/auth/auth_repository.dart';
import 'package:e_comm/data/repositories/user/user_repository.dart';
import 'package:e_comm/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/network_connection/network_connection.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/sign_up/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePass = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Sign Up
  void signup() async {
    try {
      /// start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          'assets/images/lottie/loading.json');

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// validation
      if (!signupFormKey.currentState!.validate()) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create your account,  tou must have to read and accept the Privacy Policy & term to use');
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// register user in firebase
      final user = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// save user data
      final newUser = UserModel(
        id: user.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// show success message

      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      /// move to verify email screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }
}

//

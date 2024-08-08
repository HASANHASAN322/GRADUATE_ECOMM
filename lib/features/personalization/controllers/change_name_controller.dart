import 'package:e_comm/features/personalization/controllers/user_controller.dart';
import 'package:e_comm/features/personalization/screens/profile/profile.dart';
import 'package:e_comm/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loader/loaders.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/network_connection/network_connection.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// start loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information... ',
          'assets/images/lottie/loading.json');

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// update
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      /// update Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// remove loader
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated');

      /// move to profile screen
      Get.to(() => const ProfileScreen());
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }
}

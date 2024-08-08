import 'package:e_comm/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../common/widgets/loader/loaders.dart';
import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/network_connection/network_connection.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variables
  final hidePass = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController()) ;


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '' ;
    super.onInit();
  }

  /// email & password sign in
  void emailAndPasswordSignIn() async {
    try {
      /// start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...',
          'assets/images/lottie/loading.json');

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// validation
      if (!loginFormKey.currentState!.validate()) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// save data if remember me
      if (rememberMe.value) {
      localStorage.write('REMEMBER_ME_EMAIL', email.text.trim()) ;
      localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim()) ;
      }

      /// register user in firebase
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      /// remove loader
      TFullScreenLoader.stopLoading() ;

     /// redirect
      AuthenticationRepository.instance.screenRedirect() ;
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }

  /// google sign in
  Future<void> googleSignIn() async{
    try {
      /// start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...',
          'assets/images/lottie/loading.json');

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle() ;

      /// save user data
      await userController.saveUserRecord(userCredentials) ;

      /// remove loader
      TFullScreenLoader.stopLoading() ;
    } catch (e) {
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }
}

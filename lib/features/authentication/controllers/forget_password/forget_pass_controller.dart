

import 'package:e_comm/data/repositories/auth/auth_repository.dart';
import 'package:e_comm/features/authentication/screens/password_configuration/reset_passsword.dart';
import 'package:e_comm/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loader/loaders.dart';
import '../../../../utils/network_connection/network_connection.dart';

class ForgetPassController extends GetxController{
  static ForgetPassController get instance => Get.find() ;

  /// variables
  final email  = TextEditingController() ;
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>() ;

  /// send pass reset email
  sendPasswordResetEmail() async{
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request', 'assets/images/lottie/loading.json' ) ;

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim()) ;

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

      Get.to(()=> ResetPassword(email: email.text.trim())) ;
    } catch(e){
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request', 'assets/images/lottie/loading.json' ) ;

      /// check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email) ;

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

    } catch(e){
      /// remove loader
      TFullScreenLoader.stopLoading();

      /// show errors to user
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }
}
import 'dart:async';

import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// send email when ever verify screen append & set timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Verify Your Email',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Some thing error', message: e.toString());
    }
  }

  /// timer
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
              image: TImages.staticSuccessIllustration,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
            ));
      }
    });
  }

  /// manually check if email verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser ;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
        onPressed: () =>
            AuthenticationRepository.instance.screenRedirect(),
        image: TImages.staticSuccessIllustration,
        title: TTexts.yourAccountCreatedTitle,
        subtitle: TTexts.yourAccountCreatedSubTitle,
      ));
    }
  }
}

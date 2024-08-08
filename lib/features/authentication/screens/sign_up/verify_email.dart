import 'package:e_comm/data/repositories/auth/auth_repository.dart';
import 'package:e_comm/utils/constants/image_strings.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/signup/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email ;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController()) ;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// image
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// Title & subTitle
              Text(
                TTexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              Text(
                email?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(TTexts.tContinue),
                  onPressed: () => controller.checkEmailVerificationStatus(),
                ),
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text(TTexts.reSendEmail),
                  onPressed: () => controller.sendEmailVerification(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

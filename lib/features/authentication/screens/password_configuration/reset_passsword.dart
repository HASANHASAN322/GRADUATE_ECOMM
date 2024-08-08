import 'package:e_comm/features/authentication/screens/login/login.dart';
import 'package:e_comm/utils/constants/image_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/forget_password/forget_pass_controller.dart';

class ResetPassword extends StatelessWidget {

  const ResetPassword({super.key, required this.email});

  final String email ;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPassController()) ;
  return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace) ,
        child: Column(
          children: [
            /// image
            Image(
              image:  const AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: TSize.spaceBtwSections,) ,

            /// Title & subTitle
            Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,) ,
            const SizedBox(height: TSize.spaceBtwItems,) ,
            Text(TTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,) ,
            const SizedBox(height: TSize.spaceBtwItems,) ,
            Text(TTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,) ,
            const SizedBox(height: TSize.spaceBtwSections,) ,

            /// Buttons
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=> Get.offAll(const LoginScreen()),
                child: const Text(TTexts.done),
              ),) ,
            const SizedBox(height: TSize.spaceBtwItems,) ,

            SizedBox(width: double.infinity,
              child: TextButton(
                onPressed: ()=> controller.resendPasswordResetEmail(email) ,
                child: const Text(TTexts.reSendEmail),
              ),) ,


          ],
        ),
      ),
    );
  }
  }


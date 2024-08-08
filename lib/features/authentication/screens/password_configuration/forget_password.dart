import 'package:e_comm/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/forget_password/forget_pass_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPassController()) ;
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// head
          Text(
            TTexts.forgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSize.spaceBtwItems,
          ),
          Text(
            TTexts.forgetPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSize.spaceBtwSections * 2,
          ),
          /// text filed
          Form(
            key: controller.forgetPasswordFormKey,
            child: TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwSections ,
          ),
          /// submit btn
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: ()=>  controller.sendPasswordResetEmail(),
                child: const Text(TTexts.submit)),
          ),

        ],
      ),
      ),
    );
  }
}

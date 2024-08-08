import 'package:e_comm/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_comm/features/authentication/screens/sign_up/widgets/term_condition_checkbox.dart';
import 'package:e_comm/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              /// first name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: TSize.spaceBtwInputFields,
              ),

              /// last name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                TValidator.validateEmptyText('User Name', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          /// phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNu, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),

          ///password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePass.value,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () =>
                        controller.hidePass.value = !controller.hidePass.value,
                    icon:  Icon(controller.hidePass.value ?  Iconsax.eye_slash : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwSections,
          ),

          ///terms & conditions
          const TTermAndConditionCheckBox(),
          const SizedBox(
            height: TSize.spaceBtwSections,
          ),

          /// sign up btn
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(TTexts.createAccount),
              onPressed: () => controller.signup(),
            ),
          )
        ],
      ),
    );
  }
}

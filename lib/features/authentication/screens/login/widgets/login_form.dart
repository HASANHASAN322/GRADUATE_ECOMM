import 'package:e_comm/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_comm/features/authentication/screens/sign_up/signup.dart';
import 'package:e_comm/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController()) ;
    return Form(
      key: controller.loginFormKey,
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwSections),
      child: Column(
        children: [
          /// email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields,
          ),
          /// pass
          Obx(
            ()=> TextFormField(
                controller: controller.password ,
              expands: false,
              obscureText: controller.hidePass.value,
              validator: (value) => TValidator.validateEmptyText('Password',value),
              decoration:  InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () =>
                      controller.hidePass.value = !controller.hidePass.value,
                      icon:  Icon(controller.hidePass.value ?  Iconsax.eye_slash : Iconsax.eye)),
                  labelText: TTexts.password),
            ),
          ),
          const SizedBox(
            height: TSize.spaceBtwInputFields / 2,
          ),
          ///remember me & Forget pass
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                  )),
                  const Text(TTexts.rememberMe),
                ],
              ),
              TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPasswordTitle))
            ],
          ),
          const SizedBox(
            height: TSize.spaceBtwSections,
          ),
          ///sign in btn
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  return controller.emailAndPasswordSignIn() ;},
                child: const Text(TTexts.signIn)),
          ),
          const SizedBox(
            height: TSize.spaceBtwItems,
          ),

          /// create account btn
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text(TTexts.createAccount)),
          ),
        ],
      ),
    ));
  }
}

import 'package:e_comm/common/widgets/login_signup/form_divider.dart';
import 'package:e_comm/common/widgets/login_signup/social_buttons.dart';
import 'package:e_comm/features/authentication/screens/sign_up/widgets/signup_form.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              Text(
                TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// Form
               const TSignUpForm(),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
              /// divider
               TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!) ,
              const SizedBox(
                height: TSize.spaceBtwSections/2,
              ),
              /// social btn
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}


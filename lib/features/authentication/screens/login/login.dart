import 'package:e_comm/common/style/spacing_style.dart';
import 'package:e_comm/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_comm/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo , title & sub-Title
              const TLoginHeader(),
              // form
              const TLoginForm(),
              // divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              const SizedBox(
                height: TSize.spaceBtwSections/2,
              ),
              // social btn
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}





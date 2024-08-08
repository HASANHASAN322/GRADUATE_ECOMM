import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(
        title: Text('RE-Authentication User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child:  Form(
            key: controller.reAuthFormKey ,
            child: Column(
              children: [
                /// email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail ,
                  decoration: const InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right)),
                ),
                const SizedBox(
                  height: TSize.spaceBtwInputFields,
                ),
                ///password
                Obx(
                      () => TextFormField(
                        controller: controller.verifyPassword,
                    validator: (value) => TValidator.validateEmptyText('Password', value),
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
                  height: TSize.spaceBtwInputFields,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Verify'),
                    onPressed: () => controller.reAuthEmailAndPasswordUser(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/change_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Change Name',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Use real name for easy verification. This ma e will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSize.spaceBtwSections,
            ),
            Form(
              key: controller.updateUserNameFormKey ,
              child: Column(
                children: [
                  TextFormField(
                     controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwInputFields,
                  ),

                  /// last name
                  TextFormField(
                     controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwInputFields,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () => controller.updateUserName(),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}

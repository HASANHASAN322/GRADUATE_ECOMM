import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/features/personalization/controllers/address_controller.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance ;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Add New Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value)=> TValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: TSize.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator:(value)=> TValidator.validatePhoneNumber(value) ,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: TSize.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value)=> TValidator.validateEmptyText('Stress', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Stress'),
                      ),
                    ),
                    const SizedBox(
                      width: TSize.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value)=> TValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSize.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value)=> TValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      width: TSize.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value)=> TValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSize.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.country,
                  validator: (value)=> TValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: TSize.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddress(),
                    child: const Text('Save'),
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

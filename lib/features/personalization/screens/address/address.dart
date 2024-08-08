import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/features/personalization/controllers/address_controller.dart';
import 'package:e_comm/features/personalization/screens/address/add_new_address.dart';
import 'package:e_comm/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Obx(() => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
                final response = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot);

                if (response != null) return response;
                final address = snapshot.data!;
                return ListView.builder(
                    itemCount: address.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) => TSingleAddress(
                          address: address[index],
                          onTap: () => controller.selectAddress(address[index]),
                        ));
              })),
        ),
      ),
    );
  }
}

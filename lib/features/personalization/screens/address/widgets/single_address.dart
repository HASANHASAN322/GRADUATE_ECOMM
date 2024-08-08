import 'package:e_comm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comm/features/personalization/controllers/address_controller.dart';
import 'package:e_comm/features/personalization/models/address_model.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address, required this.onTap,});

  final AddressModel address ;
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance ;
    final dark = THelperFunctions.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id ;
      final selectedAddress =  selectedAddressId == address.id ? true : false ;
      return InkWell(
        onTap: onTap,
        child: TCircularContainer(
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.grey,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
              ? TColors.darkerGray
              : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
          padding: const EdgeInsets.all( TSize.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 5,
                  child: Icon(selectedAddress ? Iconsax.tick_circle5 : null)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge) ,
                  const SizedBox(height: TSize.sm / 2,) ,
                   Text(address.formattedPhoneNo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ) ,
                  const SizedBox(height: TSize.sm / 2,) ,
                   Text(address.toString(),
                    softWrap: true,) ,
                ],
              ),
            ],
          ),
        ),
      ) ;
    }
    );
  }
}

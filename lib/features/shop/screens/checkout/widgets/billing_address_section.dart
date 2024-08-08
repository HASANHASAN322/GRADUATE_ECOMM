import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/personalization/controllers/address_controller.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'change',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: TSize.spaceBtwItems,
                      ),
                      Text(
                        '099999999',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_history,
                        color: Colors.grey,
                        size: 16,
                      ),
                      const SizedBox(
                        width: TSize.spaceBtwItems,
                      ),
                      Text(
                        'Syria - lattakia',
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                ],
              )
            : Text(
                'Select Address',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}

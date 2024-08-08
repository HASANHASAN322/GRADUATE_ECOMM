


import 'package:e_comm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comm/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_comm/features/shop/models/payment_method_model.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod ;
  @override
  Widget build(BuildContext context) {
    final controller= CheckoutController.instance ;
    return ListTile(
      contentPadding:  const EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod ;
        Get.back();
      },
      leading: TCircularContainer(
        width: 40,
        height: 40,
        backgroundColor: THelperFunctions.isDarkMode(context)? TColors.light : TColors.white,
        padding: const EdgeInsets.all(TSize.sm),
        child: Image(image: AssetImage(paymentMethod.image),fit: BoxFit.contain,),

      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}

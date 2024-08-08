import 'package:e_comm/common/widgets/icons/t_circular_icon.dart';
import 'package:e_comm/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../models/product_model.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product ;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance ;
    controller.updateAlreadyAddedProductCount(product) ;
    final dark = THelperFunctions.isDarkMode(context) ;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace , vertical: TSize.defaultSpace /2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGray : TColors.light ,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSize.cardRadiusLg) ,
          topRight: Radius.circular(TSize.cardRadiusLg) ,
        ) ,
      ),
      child:  Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus ,
                backgroundColor: TColors.darkerGray,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed:()=> controller.productQuantityInCart.value<1 ? null : controller.productQuantityInCart.value -=1,
              ) ,
              const SizedBox(width: TSize.spaceBtwItems,) ,
              Text(controller.productQuantityInCart.value.toString() , style : Theme.of(context).textTheme.titleSmall ) ,
              const SizedBox(width: TSize.spaceBtwItems,) ,
              TCircularIcon(
                icon: Iconsax.add ,
                backgroundColor: TColors.darkerGray,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed:()=> controller.productQuantityInCart.value +=1,
              ) ,
            ],
          ),
          ElevatedButton(
            onPressed: controller.productQuantityInCart.value <1 ? null : ()=> controller.addToCart(product),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSize.md) ,
                backgroundColor: TColors.black ,
                side: const BorderSide(color: TColors.black)
            ),
            child: const Text('Add To Cart') ,
          )
        ],
      )),
    );
  }
}

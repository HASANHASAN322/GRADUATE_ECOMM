import 'package:e_comm/features/shop/screens/product_details/product_details.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(()=> ProductDetail(product: product)) ;
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? TColors.primary : TColors.dark,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSize.cardRadiusMd),
                bottomRight: Radius.circular(TSize.productImageRadius)),
          ),
          child: SizedBox(
            width: TSize.iconLg * 1.2,
            height: TSize.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.white),
                    )
                  : Icon(Iconsax.add,
                      color: dark ? TColors.darkerGray : TColors.white),
            ),
          ),
        );
      }),
    );
  }
}

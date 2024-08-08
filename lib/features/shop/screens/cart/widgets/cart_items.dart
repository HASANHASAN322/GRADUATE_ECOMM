import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddAndRemoveBtn = true,
  });

  final bool showAddAndRemoveBtn;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
            height: TSize.spaceBtwSections,
          ),
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
            final item = cartController.cartItems[index];

            return Column(
              children: [
                TCartItem(
                  cartItem: item,
                ),
                if (showAddAndRemoveBtn)
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                if (showAddAndRemoveBtn)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 70,
                          ),

                          /// Add & remove btn
                          TProductQuantityWithAddRemoveButtons(
                            quantity: item.quantity,
                            add: () => cartController.addOneToCart(item),
                            remove: () =>
                                cartController.removeOneFromCart(item),
                          ),
                        ],
                      ),

                      /// price
                      TProductPriceText(price: (item.price! * item.quantity).toStringAsFixed(1))
                    ],
                  )
              ],
            );
          }),
        ));
  }
}

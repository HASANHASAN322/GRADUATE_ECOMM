import 'package:e_comm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:e_comm/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comm/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_comm/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_comm/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_comm/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/product/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'Us');

    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// items in cart
              const TCartItems(
                showAddAndRemoveBtn: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// button
              const TCouponCode(),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// billing section
              TCircularContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSize.sm),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    /// divider
                    Divider(),
                    SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    /// payment methods
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    /// address
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => TLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount')),
      ),
    );
  }
}

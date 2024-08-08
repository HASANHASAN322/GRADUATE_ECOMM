import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/utils/constants/image_strings.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/payment/payment_tile.dart';
import '../../models/payment_method_model.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value =
        PaymentMethodModel(image: TImages.paypal, name: 'Paypal');
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context, builder: (_) => SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(TSize.lg),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
                title: 'Select Payment Method',
            showActionButton: false,
            ),
            const SizedBox(height: TSize.spaceBtwSections,) ,
            TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.paypal, name: 'Paypal')) ,
            const SizedBox(height: TSize.spaceBtwItems /2,) ,
            TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.googlePay, name: 'Google Pay')) ,
            const SizedBox(height: TSize.spaceBtwItems /2,) ,
            TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.visa, name: 'Visa')) ,
            const SizedBox(height: TSize.spaceBtwItems /2,) ,
            TPaymentTile(paymentMethod: PaymentMethodModel(image: TImages.applePay, name: 'Apple Pay')) ,
            const SizedBox(height: TSize.spaceBtwItems /2,) ,
            const SizedBox(height: TSize.spaceBtwSections,) ,
          ],
        ),
      ),
    ));
  }
}

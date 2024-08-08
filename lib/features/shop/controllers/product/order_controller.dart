import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:e_comm/common/widgets/success_screen/success_screen.dart';
import 'package:e_comm/data/repositories/auth/auth_repository.dart';
import 'package:e_comm/features/personalization/controllers/address_controller.dart';
import 'package:e_comm/features/shop/controllers/product/cart_controller.dart';
import 'package:e_comm/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:e_comm/utils/constants/image_strings.dart';
import 'package:e_comm/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/orders/order_repository.dart';
import '../../../../navigation_menu.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  /// variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// fetch user orders history

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Something Wrong!', message: e.toString());
      return [];
    }
  }

  /// order processing method

  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your order..', 'assets/images/lottie/loading.json');

      /// get user id
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) {
        return;
      }

      /// add details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      /// save to FireStore
      await orderRepository.saveOrder(order, userId);

      /// update the cart
      cartController.clearCart();

      Get.off(() => SuccessScreen(
          image: TImages.successfulPaymentIcon,
          title: 'Payment Success!',
          subtitle: 'Your item will be Shipped soon!',
          onPressed: () => Get.offAll(() => const NavigationMenu())));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Something Wrong!', message: e.toString());
    }
  }
}

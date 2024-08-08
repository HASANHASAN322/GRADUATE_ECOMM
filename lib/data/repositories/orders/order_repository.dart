import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/data/repositories/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/cart_item_model.dart';
import '../../../features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.authUser?.uid;
      if (userId!.isEmpty) {
        throw 'Unable To find user info';
      }
      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something wrong';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());

      for (CartItemModel item in order.items) {
        // Fetch the product document by productId
        DocumentReference productRef = FirebaseFirestore.instance
            .collection('Products')
            .doc(item.productId);

        // Use a transaction to ensure the count is decremented atomically
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          // Get the document snapshot
          DocumentSnapshot productSnapshot = await transaction.get(productRef);

          if (productSnapshot.exists) {
            // Get the current count
            int currentCount = productSnapshot.get('Stock');
            // Calculate the new count
            int newCount = currentCount - item.quantity;

            // Update the count field
            transaction.update(productRef, {'Stock': newCount});
          }
        });
      }
    } catch (e) {
      throw 'Something wrong';
    }
  }
}

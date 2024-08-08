import 'package:e_comm/features/shop/controllers/all_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });


  final List<ProductModel> products ;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController()) ;
    controller.assignProducts(products) ;
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Newest',
            ]
                .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            value: controller.selectedSortOption.value,
            onChanged: (value) {
              controller.sortProducts(value!) ;
            }),
        const SizedBox(height: TSize.spaceBtwSections,) ,
        /// products
       Obx(() {
         return  TGridLayout(itemCount: controller.products.length,
             itemBuilder: (_ ,index)=>  TProductCardVertical(product: controller.products[index],)) ;
       })
      ],
    );
  }
}
//

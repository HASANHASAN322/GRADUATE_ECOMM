import 'package:e_comm/common/widgets/layout/grid_layout.dart';
import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/shop/controllers/category_controller.dart';
import 'package:e_comm/features/shop/models/category_model.dart';
import 'package:e_comm/features/shop/screens/all_products/all_products.dart';
import 'package:e_comm/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import 'category_brands.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),

              const SizedBox(
                height: TSize.spaceBtwItems,
              ),

              /// products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const TVerticalProductShimmer());

                    if (response != null) return response;
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        TSectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryId: category.id, limit: -1),
                          )),
                        ),
                        const SizedBox(
                          height: TSize.spaceBtwItems,
                        ),
                        TGridLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) =>
                                TProductCardVertical(product: products[index])),
                        const SizedBox(
                          height: TSize.spaceBtwItems,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/common/widgets/images/t_rounded_image.dart';
import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/shop/controllers/category_controller.dart';
import 'package:e_comm/features/shop/models/category_model.dart';
import 'package:e_comm/features/shop/screens/all_products/all_products.dart';
import 'package:e_comm/utils/constants/image_strings.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../utils/shimmer/vertical_product_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// sub categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final subCategories = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                            future: controller.getCategoryProducts(categoryId: category.id),
                            builder: (context, snapshot) {
                              final widget = TCloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  /// heading
                                  TSectionHeading(
                                    title: subCategory.name,
                                    onPressed: () => Get.to(() => AllProducts(
                                          title: subCategory.name,
                                          futureMethod:
                                              controller.getCategoryProducts(
                                                  categoryId: subCategory.id,
                                                  limit: -1),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: TSize.spaceBtwItems / 2,
                                  ),

                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                           TProductCardHorizontal(product: products[index],),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: TSize.spaceBtwItems,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

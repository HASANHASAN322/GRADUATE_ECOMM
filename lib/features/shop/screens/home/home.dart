import 'package:e_comm/features/shop/screens/all_products/all_products.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/shimmer/vertical_product_shimmer.dart';
import '../../controllers/product/product_controller.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// app bar
                  THomeAppbar(),
                  SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// search bar
                  TSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// categories
                  Padding(
                    padding: EdgeInsets.only(left: TSize.defaultSpace),
                    child: Column(
                      children: [
                        /// heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSize.spaceBtwItems,
                        ),

                        /// categories
                        THomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TSize.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// body
            const Padding(
                padding: EdgeInsets.all(TSize.defaultSpace / 2),
                child: TPromoSlider()),
            const SizedBox(
              height: TSize.spaceBtwSections / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSize.defaultSpace),
              child: TSectionHeading(
                title: 'Popular Products',
                onPressed: () => Get.to(() => AllProducts(
                      title: 'Popular Products',
                  futureMethod: controller.fetchAllFeaturedProducts(),
                    )),
              ),
            ),
            const SizedBox(
              height: TSize.spaceBtwItems,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
                child: Obx(
                  () {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }

                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                        product: controller.featuredProducts[index],
                      ),
                      mainAxisExtent: 260,
                    );
                  },
                )),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_comm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_comm/common/widgets/layout/grid_layout.dart';
import 'package:e_comm/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/shop/controllers/brand_controller.dart';
import 'package:e_comm/features/shop/controllers/category_controller.dart';
import 'package:e_comm/features/shop/screens/brand/all_brands.dart';
import 'package:e_comm/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/shimmer/brand_shimmer.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: false,
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [TCartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSize.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// searchbar
                      const SizedBox(
                        height: TSize.spaceBtwItems,
                      ),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSize.gridViewSpacing,
                      ),

                      /// Brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwItems / 1.5,
                      ),

                      Obx(() {
                        if(brandController.isLoading.value) return const TBrandShimmer() ;
                        return TGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index] ;
                              return  TBrandCard(
                                brand: brand,
                                showBorder: true,
                              );
                            });
                      }),
                    ],
                  ),
                ),
                bottom: TTabBar(
                  tabs: categories
                      .map((category) => Tab(
                    child: Text(category.name),
                  ))
                      .toList(),
                ),
              )
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => TCategoryTab(
              category: category,
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

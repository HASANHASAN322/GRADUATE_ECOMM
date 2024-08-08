import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/common/widgets/brands/brand_card.dart';
import 'package:e_comm/common/widgets/layout/grid_layout.dart';
import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/shop/controllers/brand_controller.dart';
import 'package:e_comm/features/shop/screens/brand/brand_products.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/shimmer/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance ;
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Brand',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),

              /// brands
              Obx(() {
                if(controller.isLoading.value) return const TBrandShimmer() ;
                return TGridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = controller.allBrands[index] ;
                      return  TBrandCard(
                        brand: brand,
                        showBorder: true,
                        onTap: ()=> Get.to(()=>  BrandProducts(brand: brand,)),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

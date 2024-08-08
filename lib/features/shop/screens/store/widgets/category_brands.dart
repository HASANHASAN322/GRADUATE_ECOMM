import 'package:e_comm/features/shop/controllers/brand_controller.dart';
import 'package:e_comm/features/shop/models/category_model.dart';
import 'package:e_comm/utils/helpers/cloud_helper_functions.dart';
import 'package:e_comm/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot ) ;
          if(widget != null) return const TVerticalProductShimmer() ;
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id , limit: 2),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot ) ;
                    if(widget != null) return const Center() ;
                    final products = snapshot.data!;
                    return TBrandShowcase(
                      brand: brand,
                      images: products.map((e) => e.thumbnail).toList(),
                    );
                  });
            },
          );
        });
  }
}

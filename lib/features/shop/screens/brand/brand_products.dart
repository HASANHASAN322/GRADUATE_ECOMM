import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/common/widgets/brands/brand_card.dart';
import 'package:e_comm/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_comm/features/shop/controllers/brand_controller.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/cloud_helper_functions.dart';
import 'package:e_comm/utils/shimmer/vertical_product_shimmer.dart';
import 'package:flutter/material.dart';

import '../../models/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              /// brand detail
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              ///
              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context , snapshot){

                    final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot , ) ;
                    if(widget != null ) return const TVerticalProductShimmer() ;
                    final brandProducts = snapshot.data! ;
                    return  TSortableProducts(products: brandProducts) ;

                  })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_comm/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../models/product_model.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// product Image Slider
              TProductImageSlider(product: product,),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSize.defaultSpace,
                left: TSize.defaultSpace,
                bottom: TSize.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating & share button
                  const TRatingAndShare(),

                  /// price -- title -- stock & brand
                   TProductMetaData(product: product,),

                  /// -- Attributes
                 if(product.productType == ProductType.variable.toString())  TProductAttributes(product: product,),
                  if(product.productType == ProductType.variable.toString()) const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('CheckOut'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),

                  /// description
                  const TSectionHeading(title: 'Description'),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                   ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// reviews
                  const Divider(),
                  const SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        title: 'Reviews(199)',
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

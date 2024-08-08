import 'package:e_comm/common/widgets/images/t_rounded_image.dart';
import 'package:e_comm/common/widgets/products/fav_btn/favourite_icon.dart';
import 'package:e_comm/features/shop/controllers/product/product_controller.dart';
import 'package:e_comm/features/shop/models/product_model.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../style/t_shadow_style.dart';
import '../../custom_shapes/containers/circular_container.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';
import '../../texts/product_price_text.dart';
import '../add_to_cart_btn/add_to_cart_btn.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product,  });

  final ProductModel product ;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance ;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice) ;
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() =>  ProductDetail(product: product,)),
      child: Container(
        width: 180,
        height: 300,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ?   TColors.darkerGray : TColors.light  ,
        ),
        child: Column(
          children: [
            TCircularContainer(
              height: 170,
              width: 180,
              radius: TSize.productImageRadius,
              padding: const EdgeInsets.all(TSize.sm / 2),
              backgroundColor: dark ? TColors.darkerGray : TColors.light,
              child: Stack(
                children: [
                  /// image
                  TRoundedImage(
                    height: 180,
                    padding: EdgeInsets.zero,
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),

                  /// sale tag
                  if(salePercentage != null ) Positioned(
                    top: 12,
                    left: 10,
                    child: TCircularContainer(
                      height: 25,
                      width: 50,
                      radius: TSize.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      child: Center(
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      ),
                    ),
                  ),

                  /// fav btn
                   Positioned(
                    top: 1,
                    right: 1,
                    child: TFavouriteIcon(productId: product.id,),
                  ),
                ],
              ),
            ),

            /// details

            Padding(
              padding: const EdgeInsets.only(left: TSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// product name
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  /// Brand
                  TBrandTitleWithVerifiedIcon(title: product.brand!.name,) ,
                  /// Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// price
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(product.productType == ProductType.single.toString() && product.salePrice! > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: TSize.sm),
                                child: Text(
                                  product.price.toString() ,
                                  style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            /// price
                            Padding(
                              padding: const EdgeInsets.only(left: TSize.sm),
                              child: TProductPriceText(price: controller.getProductPrice(product), isLarge: false,),
                            ),
                          ],
                        ),
                      ),
                      /// add to cart btn
                      ProductCardAddToCartButton(product: product) ,


                    ],
                  ) ,

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





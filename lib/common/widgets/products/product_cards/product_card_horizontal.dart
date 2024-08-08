import 'package:e_comm/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_comm/common/widgets/images/t_rounded_image.dart';
import 'package:e_comm/common/widgets/products/fav_btn/favourite_icon.dart';
import 'package:e_comm/common/widgets/texts/product_title_text.dart';
import 'package:e_comm/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_comm/features/shop/models/product_model.dart';
import 'package:e_comm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../texts/product_price_text.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key , required this.product});

  final ProductModel product ;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance ;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice) ;
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.productImageRadius),
        color: dark ? TColors.darkerGray : TColors.lightContainer,
      ),
      child: Row(
        children: [
          TCircularContainer(
            height: 120,
            width: 150,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                 SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    )),

                /// sale tag
                Positioned(
                  top: 8,
                  left: 1,
                  child: TCircularContainer(
                    height: 25,
                    width: 40,
                    radius: TSize.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    child: Center(
                      child: Text(
                        '$salePercentage',
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
                  child:TFavouriteIcon(productId: product.id,)
                ),
              ],
            ),
          ),

          /// details

          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSize.sm, left: TSize.sm),
              child: Column(
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(
                        height: TSize.spaceBtwItems / 2,
                      ),
                      TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),
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
                      Container(
                        decoration: BoxDecoration(
                          color : dark ? TColors.light :  TColors.darkerGray ,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(TSize.cardRadiusMd) ,
                              bottomRight: Radius.circular(TSize.productImageRadius)
                          ),

                        ),
                        child:  SizedBox(
                          width: TSize.iconLg * 1.2,
                          height: TSize.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                                Iconsax.add ,color: dark ?  TColors.darkerGray : TColors.white
                            ),
                          ),
                        ),
                      ) ,
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

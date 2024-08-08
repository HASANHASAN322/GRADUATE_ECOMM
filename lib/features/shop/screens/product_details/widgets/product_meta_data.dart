import 'package:e_comm/common/widgets/images/t_circular_image.dart';
import 'package:e_comm/common/widgets/texts/product_title_text.dart';
import 'package:e_comm/common/widgets/texts/product_price_text.dart';
import 'package:e_comm/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_comm/features/shop/controllers/product/product_controller.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// price & sale price
        Row(
          children: [
            /// sale tag
            TCircularContainer(
              radius: TSize.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSize.sm, vertical: TSize.sm),
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
            const SizedBox(
              width: TSize.spaceBtwItems,
            ),

            /// price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice! > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice! > 0)
              const SizedBox(
                width: TSize.spaceBtwItems,
              ),
            TProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 1.5,
        ),

        /// title
        TProductTitleText(title: product.title),
        const SizedBox(
          height: TSize.spaceBtwItems / 1.5,
        ),

        /// stack status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(
              width: TSize.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems / 1.5,
        ),

        /// brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}

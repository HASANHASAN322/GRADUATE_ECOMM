import 'package:e_comm/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder, this.onTap, required this.brand,
  });

  final BrandModel brand ;
  final bool showBorder ;
  final void Function()? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TCircularContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showBorder: showBorder,
        radius: 15,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor:
                THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
              ),
            ),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),

            /// text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: brand.name,
                  ),
                  Flexible(
                    child: Text(
                      '${brand.productsCount ?? 0} products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

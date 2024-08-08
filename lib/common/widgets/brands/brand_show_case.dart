import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comm/features/shop/screens/brand/brand_products.dart';
import 'package:e_comm/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TCircularContainer(
        showBorder: true,
        radius: 15,
        height: 190,
        borderColor: TColors.darkGray,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSize.spaceBtwItems),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Brand with Products Count
            TBrandCard(showBorder: false, brand: brand),
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),

            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: TCircularContainer(
          height: 90,
          radius: 10,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGray
              : TColors.light,
          margin:
              const EdgeInsets.only(right: TSize.sm ),
          padding: const EdgeInsets.all(TSize.md),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const TShimmerEffect(width: 100, height: 100),
            errorWidget: (context , url , error) => const Icon(Icons.error),
          )));
}

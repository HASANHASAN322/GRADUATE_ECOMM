import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) return const TShimmerEffect(width: double.infinity, height: 190) ;
      if(controller.banners.isEmpty){return const Center(child: Text('NO Data Found'),) ;} else{
        return  Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TSize.borderRadiusMd)),
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map((banner) => TRoundedImage(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  onPressed: () => Get.toNamed(banner.targetScreen),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: TSize.spaceBtwItems,
            ),
            Center(
              child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                      controller.carousalCurrentIndex.value == i
                          ? TColors.primary
                          : TColors.grey,
                    )
                ],
              )),
            )
          ],
        ) ;
      }

    });
  }
}

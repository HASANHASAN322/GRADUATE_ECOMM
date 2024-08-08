import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comm/common/widgets/products/fav_btn/favourite_icon.dart';
import 'package:e_comm/features/shop/controllers/product/images_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGray : TColors.light,
        child: Stack(
          children: [
            /// main large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSize.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: ()=> controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: TColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// image slider
            Positioned(
                right: 0,
                bottom: 30,
                left: TSize.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSize.spaceBtwItems,
                    ),
                    itemBuilder: (_, index) => Obx(() {
                      final imageSelected = controller.selectedProductImage.value == images[index] ;
                      return  TRoundedImage(
                          width: 80,
                          isNetworkImage: true,
                          backgroundColor: dark ? TColors.dark : TColors.white,
                          padding: const EdgeInsets.all(TSize.sm),
                          border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                          onPressed: ()=> controller.selectedProductImage.value = images[index],
                          imageUrl: images[index]) ;
                    }),
                  ),
                )),

            /// app bar icons
             TAppBar(
              showBackArrow: true,
              actions: [
              TFavouriteIcon(productId: product.id ,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

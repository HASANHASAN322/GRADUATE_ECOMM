import 'package:e_comm/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/favourites_controller.dart';
import '../../icons/t_circular_icon.dart';


class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId ;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController()) ;
    return Obx(() =>
        TCircularIcon(
      width: 40,
      height: 40,
      icon: controller.isFavourite(productId) ?  Iconsax.heart5 : Iconsax.heart,
      color: controller.isFavourite(productId) ? TColors.error :null,
          onPressed: ()=> controller.toggleFavoriteProduct(productId),
    ));
  }
}

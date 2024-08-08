

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comm/features/shop/models/product_model.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController{
  static ImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs ;


  /// Get all images
  List<String> getAllProductImages(ProductModel  product){
    /// set to add unique images
     Set<String> images = {} ;


     images.add(product.thumbnail) ;

     selectedProductImage.value = product.thumbnail ;

     if(product.images != null){
       images.addAll(product.images!) ;
     }

     if(product.productVariations != null || product.productVariations!.isNotEmpty){
       images.addAll(product.productVariations!.map((variation) => variation.image)) ;
     }

     return images.toList() ;
  }

  /// show image popup
 void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true ,
        ()=> Dialog.fullscreen(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: TSize.defaultSpace * 2, horizontal: TSize.defaultSpace) ,
                  child: CachedNetworkImage(imageUrl: image),
                ) ,
                const SizedBox(height: TSize.spaceBtwSections,) ,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 150,
                    child: OutlinedButton(onPressed: ()=> Get.back(), child: const Text('Close')),
                  ),
                )
              ],
            ),
          ),
        )
    );

 }
}
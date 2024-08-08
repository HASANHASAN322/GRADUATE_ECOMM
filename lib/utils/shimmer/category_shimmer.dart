
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key,  this.itemCount = 6});


  final int itemCount ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child:  ListView.separated(
        separatorBuilder: (_ , __ )=> const SizedBox(width: TSize.spaceBtwItems,),
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(width: 55, height: 55 , radius: 55,) ,
                SizedBox(height: TSize.spaceBtwItems / 2,) ,
                
                // text
                TShimmerEffect(width: 55, height: 8)
              ],
            );
          }),
    );
  }
}

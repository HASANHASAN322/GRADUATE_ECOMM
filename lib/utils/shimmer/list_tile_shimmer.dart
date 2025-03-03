import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TShimmerEffect(width: 50, height: 50 , radius: 50,) ,
        SizedBox(width: TSize.spaceBtwItems,) ,
        Column(
          children: [
            TShimmerEffect(width: 100, height: 15) ,
            SizedBox(width: TSize.spaceBtwItems /2 ,) ,
            TShimmerEffect(width: 80, height: 12) ,
          ],
        )
      ],
    );
  }
}

import 'package:e_comm/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110,)) ,
            SizedBox(width: TSize.spaceBtwItems,) ,
            Expanded(child: TShimmerEffect(width: 150, height: 110,)) ,
            SizedBox(width: TSize.spaceBtwItems,) ,
            Expanded(child: TShimmerEffect(width: 150, height: 110,)) ,
          ],
        )
      ],
    );
  }
}

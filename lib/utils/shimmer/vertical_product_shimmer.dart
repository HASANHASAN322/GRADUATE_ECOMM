

import 'package:e_comm/utils/constants/sizes.dart';
import 'package:e_comm/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/layout/grid_layout.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key,  this.itemCount = 4});

  final int itemCount ;
  @override
  Widget build(BuildContext context) {
    return  TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, index) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSize.spaceBtwItems,) ,
            ///
             TShimmerEffect(width: 160, height: 15) ,
            SizedBox(height: TSize.spaceBtwItems / 2) ,
            TShimmerEffect(width: 110, height: 15) ,

          ],
        ),
      ),
      mainAxisExtent: 260,
    );
  }
}

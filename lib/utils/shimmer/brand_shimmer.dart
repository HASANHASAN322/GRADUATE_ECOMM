


import 'package:e_comm/common/widgets/layout/grid_layout.dart';
import 'package:e_comm/utils/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({super.key,  this.itemCount = 4});

  final int itemCount ;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_,__)=> const TShimmerEffect(width: 300, height: 80));
  }
}

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width ,
    this.height ,
    this.radius = 10 ,
    this.padding ,
    this.child,
    this.backgroundColor = TColors.white,
     this.margin,  this.showBorder = false,  this.borderColor = TColors.grey,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder? Border.all(width: 1 , color: borderColor ) : null,
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}

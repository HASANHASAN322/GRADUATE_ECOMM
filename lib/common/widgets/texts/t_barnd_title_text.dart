import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,  this.maxLines =3, this.textColor, this.textAlign = TextAlign.center,  this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;



  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: brandTextSize == TextSizes.small ?
      Theme.of(context).textTheme.labelMedium!.apply(color: textColor) :
      brandTextSize == TextSizes.medium ?
      Theme.of(context).textTheme.bodyLarge!.apply(color: textColor) :
      brandTextSize == TextSizes.medium ?
      Theme.of(context).textTheme.titleLarge!.apply(color: textColor) :
      Theme.of(context).textTheme.bodyMedium!.apply(color: textColor)
      ,
    );
  }
}

import 'package:e_comm/common/widgets/texts/t_barnd_title_text.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
     this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
     this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TBrandTitleText(
          title: title,
          maxLines: maxLines,
          textColor: textColor,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        ),
        const SizedBox(
          width: TSize.xs,
        ),
         Icon(
          Iconsax.verify5,
          color:iconColor ,
          size: TSize.iconXs,
        )
      ],
    );
  }
}


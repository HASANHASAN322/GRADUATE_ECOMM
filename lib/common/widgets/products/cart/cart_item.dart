import 'package:e_comm/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem ;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;

    return Row(

      children: [
        /// image
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding:  const EdgeInsets.all(TSize.sm),
          backgroundColor: dark ? TColors.darkerGray : TColors.light,
          isNetworkImage: true,
        ) ,
        const SizedBox(width: TSize.spaceBtwSections,),
        /// title , price , size
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                 TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? '') ,
                 Flexible(child: TProductTitleText(title: cartItem.title , maxLines: 1,)) ,
                /// Attributes
                Text.rich(
                    TextSpan(
                        children: (cartItem.selectedVariation?? {}).entries.map((e) => TextSpan(
                          children: [
                            TextSpan(text: e.key , style: Theme.of(context).textTheme.bodySmall) ,
                            TextSpan(text: e.value , style: Theme.of(context).textTheme.bodyLarge) ,
                          ]
                        )).toList()
                    )
                ) ,
              ],
            )
        )
      ],
    );
  }
}

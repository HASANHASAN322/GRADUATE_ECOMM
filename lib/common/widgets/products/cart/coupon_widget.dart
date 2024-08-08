import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/circular_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context) ;

    return TCircularContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white ,
      padding: const EdgeInsets.all( TSize.sm  ),
      child: Row(
        children: [
          /// textField
          Flexible(child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Have a promo code? Enter here' ,
              border: InputBorder.none ,
              focusedBorder: InputBorder.none ,
              enabledBorder: InputBorder.none ,
              disabledBorder: InputBorder.none ,
            ),
          )) ,
          /// button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.black.withOpacity(0.5) ,
                  backgroundColor: TColors.grey.withOpacity(0.5) ,
                  side: BorderSide(color: TColors.grey.withOpacity(0.1))
              ),

              child: const Text('Apply'),),
          ) ,
        ],
      ),
    );
  }
}

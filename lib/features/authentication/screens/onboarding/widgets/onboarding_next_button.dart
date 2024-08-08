import 'package:e_comm/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSize.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
         style: ElevatedButton.styleFrom(
             shape: const CircleBorder(),
             backgroundColor: dark ? TColors.primary : TColors.black),
          child: const Icon(Icons.keyboard_arrow_right_sharp , color: Colors.white,),

        ));
  }
}

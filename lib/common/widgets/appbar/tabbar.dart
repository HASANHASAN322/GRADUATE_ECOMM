import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget{
  const TTabBar({
    super.key, required this.tabs,
  });


  final List<Widget> tabs ;
  @override
  Widget build(BuildContext context) {
    final dark  = THelperFunctions.isDarkMode(context) ;
    return Material(
      child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          unselectedLabelColor: TColors.darkGray,
          labelColor: dark? TColors.white : TColors.primary,
          tabs: tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}

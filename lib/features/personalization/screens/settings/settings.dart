import 'package:e_comm/common/widgets/appbar/appbar.dart';
import 'package:e_comm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_comm/common/widgets/texts/section_heading.dart';
import 'package:e_comm/features/admin_panel/admin_panel.dart';
import 'package:e_comm/features/personalization/screens/address/address.dart';
import 'package:e_comm/utils/constants/colors.dart';
import 'package:e_comm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/list_tiles/setting_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/orders/orders.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          /// header
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              TAppBar(
                title: Text(
                  'Account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white),
                ),
              ),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),

              /// user profile card
              TUserProfileTitle(
                  onPressed: () => Get.to(() => const ProfileScreen())),
              const SizedBox(
                height: TSize.spaceBtwSections,
              ),
            ],
          )),

          /// body
          Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              children: [
                /// Account Settings
                const TSectionHeading(
                  title: 'Account Settings',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),

                /// address
                TSettingMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Addresses',
                  subtitle: 'Set shopping delivery address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                /// cart
                TSettingMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () => Get.to(() => const CartScreen()),
                ),
                /// orders
                TSettingMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subtitle: 'In-progress and Completed Orders',
                  onTap: () => Get.to(()=> const OrderScreen()),
                ),

                /// app setting
                const SizedBox(
                  height: TSize.spaceBtwItems,
                ),
                InkWell(
                  onTap:()=> Get.to(()=> const AdminPanel()),
                  child:  const TSettingMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload Data to your Cloud Firebase'),
                ),

                /// logout btn
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Logout'),
                  ),
                ),
                const SizedBox(
                  height: TSize.spaceBtwSections,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

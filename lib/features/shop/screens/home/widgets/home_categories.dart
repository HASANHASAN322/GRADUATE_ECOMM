import 'package:e_comm/features/shop/controllers/category_controller.dart';
import 'package:e_comm/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:e_comm/utils/shimmer/category_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const TCategoryShimmer();
      } else {
        return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() =>  SubCategoriesScreen(category: category,)),
              );
            }),
      );
      }
    });
  }
}

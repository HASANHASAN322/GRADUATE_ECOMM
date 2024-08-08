import 'package:e_comm/data/repositories/categories/category_repository.dart';
import 'package:e_comm/features/shop/models/category_model.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loader/loaders.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  List featuredCategories = <CategoryModel>[];

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// load category data
  Future<void> fetchCategories() async {
    try {
      /// show loader
      isLoading.value = true;

      /// Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      /// update the category list
      allCategories.addAll(categories);

      /// filter featured categories
      featuredCategories.addAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
      update();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// load selected category data
  Future<List<CategoryModel>> getSubCategories(String categoryId) async{
    try{
      final subCategories = await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Something Wrong' , message: e.toString()) ;
      return[] ;
    }
  }

  /// get category or sub_category product
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {

      try{
        final products = await ProductRepository.instance
            .getProductsForCategory( limit: limit, categoryId: categoryId);
        return products;
      }catch(e){
        TLoaders.errorSnackBar(title: 'Something Wrong' , message: e.toString()) ;
        return[] ;
      }

  }
}

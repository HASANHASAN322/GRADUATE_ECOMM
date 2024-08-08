import 'package:e_comm/data/repositories/product/product_repository.dart';
import 'package:e_comm/features/shop/models/brand_model.dart';
import 'package:e_comm/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loader/loaders.dart';
import '../../../data/repositories/brands/brand_repository.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// load brands
  Future<void> getFeaturedBrands() async {
    try {
      /// show loader
      isLoading.value = true;

      /// Fetch categories from data source
      final brands = await brandRepository.getAllBrands();

      /// update the category list
      allBrands.addAll(brands);

      /// filter featured categories
      featuredBrands.addAll(allBrands
          .where((brand) => brand.isFeatured ?? false)
          .take(4)
          .toList());
      update();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// get brand for category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
      return [] ;
    }
  }

  /// get brand specific
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId , limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
      return [];
    }
  }
}

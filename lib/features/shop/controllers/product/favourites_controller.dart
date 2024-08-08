

import 'dart:convert';

import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:e_comm/data/repositories/product/product_repository.dart';
import 'package:e_comm/features/shop/models/product_model.dart';
import 'package:e_comm/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController{
  static FavouriteController get instance => Get.find() ;

  final favourite = <String , bool>{}.obs;

  @override
  void onInit() {
    super.onInit() ;
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if(json != null){
      final storedFavorites = jsonDecode(json) as Map<String , dynamic>;
    favourite.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId){
    return favourite[productId] ?? false ;
  }

  void toggleFavoriteProduct(String productId){
    if(!favourite.containsKey(productId)){
      favourite[productId] = true ;
      saveFavoritesToStorage();
      TLoaders.customToast(message: 'product has been added to the WishList');
    } else {
      TLocalStorage.instance().removeData(productId) ;
      favourite.remove(productId);
      saveFavoritesToStorage();
      favourite.refresh();
      TLoaders.customToast(message: 'product has been removed from the WishList');

    }
  }

  void saveFavoritesToStorage (){
    final encodedFavorites = json.encode(favourite) ;
    TLocalStorage.instance().saveData('favorites' , encodedFavorites) ;
  }

  Future<List<ProductModel>> favoriteProducts() async{
    return await ProductRepository.instance.getFavouriteProducts(favourite.keys.toList());
  }
}
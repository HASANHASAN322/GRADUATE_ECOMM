

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_category_model.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../../features/shop/models/product_category_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  /// Get all Brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs
          .map((document) => BrandModel.fromSnapshot(document))
          .toList();
      return result;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }

/// get brand for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategories').where('categoryId' , isEqualTo: categoryId).get();
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList() ;
      final brandQuery = await _db.collection('Brands').where(FieldPath.documentId , whereIn: brandIds).limit(2).get() ;
      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList() ;
      return brands ;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again';
    }
  }



  Future<void> uploadBrandsData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(TFirebaseStorageService());
      for (var brand in brands) {
        final file = await storage.getImageDataFromAssets(brand.image);
        final url = await storage.uploadImageData(
            'Brands/Images', file, brand.image.toString());
        brand.image = url;
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> uploadBrandCategoryModel(List<BrandCategoryModel> brandCategories) async {
    try {
      for (var brand in brandCategories) {
        await _db.collection('BrandCategories').doc().set(brand.toJson());
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> uploadProductCategoryModel(List<ProductCategoryModel> productCategories) async {
    try {
      for (var brand in productCategories) {
        await _db.collection('productCategories').doc().set(brand.toJson());
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw '$e';
    }
  }

}
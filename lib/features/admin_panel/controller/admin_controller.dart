import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/common/widgets/loader/loaders.dart';
import 'package:e_comm/features/shop/models/brand_model.dart';
import 'package:e_comm/utils/constants/enums.dart';
import 'package:e_comm/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../shop/models/product_model.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  Uint8List? image;
  var userData = {};
  ProductModel? product;
  final count = TextEditingController();
  final price = TextEditingController();
  final name = TextEditingController();
  final description = TextEditingController();

  /// functions
  selectImage() async {
    image = await pickImage(ImageSource.gallery);
    update();
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    update();
    throw 'No Image Selected';
  }

  Future<String> uploadImage(Uint8List? imageData) async {
    try {
      print(
          '==============================upload image func=============================================');

      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('Products/Images/new.jpg');
      print(
          '==============================$storageRef=============================================');

      // رفع الصورة
      UploadTask uploadTask = storageRef.putData(imageData!);
      print(
          '==============================$uploadTask=============================================');

      TaskSnapshot snapshot = await uploadTask;
      print(
          '==============================$snapshot=============================================');

      // الحصول على رابط التحميل للصورة
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print(
          '================================$downloadUrl===========================================');

      return downloadUrl;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Can\'t Load the Image', message: e.toString());
      return '';
    }
  }

  /// Upload data
  Future<void> uploadProductData(
      {required Uint8List? thumbnail,
      required int count,
      required double price,
      required String name,
      required String description}) async {
    try {
     TFullScreenLoader.openLoadingDialog('Loading.. ',  'assets/images/lottie/loading.json') ;
      print(
          '==================================upload data func=========================================');

      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('Products');
      // Get the collection snapshot
      QuerySnapshot snapshot = await collectionRef.get();
      // Return the number of documents in the collection
      int num = snapshot.docs.length + 001;
      String id = num.toString();
      print(
          '=================================$id==========================================');

      String imageUrl = await uploadImage(thumbnail);
      print(
          '====================================$imageUrl=======================================');

      ProductModel product = ProductModel(
        id: id,
        stock: count,
        price: price,
        title: name,
        productType: ProductType.single.toString(),
        description: description,
        isFeatured: true,
        thumbnail: imageUrl,
        productAttributes: [] ,
        sku: '' ,
        salePrice: price ,
        brand: BrandModel.empty() ,
        categoryId: '' ,
        date: DateTime.now() ,
        images: [] ,
        productVariations: []
      );
      print(
          '====================================${product.toJson()}=======================================');

      // رفع بيانات المنتج إلى Firestore
      await FirebaseFirestore.instance
          .collection('Products')
          .doc(id)
          .set(product.toJson());
    TFullScreenLoader.stopLoading() ;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Can\'t Load the product', message: e.toString());
    }
  }


  void resetFormFields() {
    name.clear();
  price.clear() ;
  description.clear() ;
  image?.clear() ;
  count.clear() ;
  }
}

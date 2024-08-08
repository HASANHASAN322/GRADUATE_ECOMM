
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/features/shop/models/banner_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find() ;

  /// variables
  final _db = FirebaseFirestore.instance ;

  /// get all orders related to current user

  Future<List<BannerModel>> fetchBanners() async {
    try {
    final result = await _db.collection('Banners').where('active' , isEqualTo: true).get() ;
    return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList() ;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong' ;
    }
  }


  /// Upload banners to the cloud firestore
  /// Update Banner to the cloud store
  Future<void> uploadBannerData(List<BannerModel> banners) async {
    try {
      final storage= Get.put(TFirebaseStorageService()) ;
      int i = 0 ;
      for(var banner in banners ){
        final file = await storage.getImageDataFromAssets(banner.imageUrl) ;
        final url = await storage.uploadImageData('Banners' , file , banner.targetScreen) ;

        banner.imageUrl = url ;
        await _db.collection('Banners').doc(i.toString()).set(banner.toJson()) ;
        i++ ;
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
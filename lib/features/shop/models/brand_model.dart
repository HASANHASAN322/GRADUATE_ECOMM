

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel{
  String  id;
  String name ;
  String image ;
  bool? isFeatured ;
  int? productsCount;

  BrandModel({
    required this.id ,
    required this.name ,
    required this.image ,
    this.isFeatured ,
    this.productsCount ,
  }) ;

  /// empty
  static BrandModel empty()=> BrandModel(id: '', name: '', image: '') ;

  /// to json
  toJson(){
    return {
      'Id' : id ,
      'Name' : name ,
      'Image' : image ,
      'IsFeatured' : isFeatured ,
      'ProductsCount' : productsCount ,
    };
  }

  factory BrandModel.fromJson(Map<String , dynamic> document){
    final data = document ;
    if(data.isEmpty) return BrandModel.empty() ;
    return BrandModel(id: data['Id'] ?? '', name: data['Name'] ?? '', image: data['Image'] ?? '') ;
  }

  /// Map json from firebase to userModel
  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
          id: document.id,
          image: data['Image'] ,
          isFeatured: data['IsFeatured'] ,
          name: data['Name'] ,
          productsCount: data['ProductsCount']
      );
    } else {
      return BrandModel.empty();
    }
  }
}
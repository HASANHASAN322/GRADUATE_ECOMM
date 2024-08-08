import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.image,
      required this.isFeatured,
      required this.name,
      this.parentId = ''});

  /// empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: '', image: '', isFeatured: false, name: '');

  /// convert to json to store data
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured
    };
  }

  /// Map json from firebase to userModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoryModel(
          id: document.id,
          image: data['Image'] ,
          isFeatured: data['IsFeatured'] ,
          name: data['Name'] );
    } else {
      return CategoryModel.empty();
    }
  }
}



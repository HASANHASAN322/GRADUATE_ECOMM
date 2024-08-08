import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel{
  String imageUrl ;
  final String targetScreen ;
  final bool active ;

  BannerModel({required this.imageUrl ,required this.active ,required this.targetScreen ,}) ;

  Map<String , dynamic> toJson(){
    return{
      'imageUrl' : imageUrl ,
      'targetScreen' : targetScreen ,
      'active' : active ,
    } ;
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String , dynamic> ;
    return BannerModel(imageUrl: data['imageUrl'], active: data['active'], targetScreen: data['targetScreen']) ;
  }
}
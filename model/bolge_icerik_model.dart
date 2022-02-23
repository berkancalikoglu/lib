import 'package:cloud_firestore/cloud_firestore.dart';

class BolgeIcerikModel{

  String? name;
  String? comment;
  String? imgUrl;
  String? youtubeId;
  String? lat;
  String? lon;

  BolgeIcerikModel({required this.name, required this.comment, required this.imgUrl, required this.youtubeId, required this.lat, required this.lon});

  factory BolgeIcerikModel.fromDocumentSnapshot({required DocumentSnapshot<Map<String,dynamic>>doc}){
    return BolgeIcerikModel(
        name: doc.data()!['name'],
        imgUrl: doc.data()!['imgUrl'],
        comment: doc.data()!['comment'],
        youtubeId: doc.data()!['youtubeId'],
        lat: doc.data()!['lat'],
        lon: doc.data()!['lon']
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class Kategori{

  String? name;
  String? imgUrl;
  String? colorHex;


  Kategori({this.name,this.imgUrl,this.colorHex});

  factory Kategori.fromDocumentSnapshot({required DocumentSnapshot<Map<String,dynamic>>doc}){
    return Kategori(
      name: doc.data()!['name'],
      imgUrl: doc.data()!['imgUrl'],
      colorHex: doc.data()!['colorHex']

    );
  }
}
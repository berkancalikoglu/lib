import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/kategori_model.dart';

final _fireStore = FirebaseFirestore.instance;

Stream<List<Kategori>> getKategori() {
  try {
    return _fireStore.collection("kategoriler").snapshots().map((kategori) {
      final List<Kategori> kategoriFromFirestore = <Kategori>[];
      for (final DocumentSnapshot<Map<String, dynamic>> doc in kategori.docs) {
        kategoriFromFirestore.add(Kategori.fromDocumentSnapshot(doc: doc));
      }
      return kategoriFromFirestore;
    });
  } catch (e) {
    rethrow;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/bolge_icerik_model.dart';

final _fireStore = FirebaseFirestore.instance;

Stream<List<BolgeIcerikModel>> getBolgeIcerikler(int index) {
  try {
    return _fireStore
        .collection("kategoriler")
        .doc(index.toString())
        .collection("bolgeler")
        .snapshots()
        .map((bolgeIcerik) {
      final List<BolgeIcerikModel> bolgeIcerikFromFirestore =
          <BolgeIcerikModel>[];
      for (final DocumentSnapshot<Map<String, dynamic>> doc
          in bolgeIcerik.docs) {
        bolgeIcerikFromFirestore
            .add(BolgeIcerikModel.fromDocumentSnapshot(doc: doc));
      }
      return bolgeIcerikFromFirestore;
    });
  } catch (e) {
    rethrow;
  }
}

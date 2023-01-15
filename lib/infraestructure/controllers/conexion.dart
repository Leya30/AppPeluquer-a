import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// C: CREATE
Future insert(
    {required Map<String, dynamic> json, required String collectionId}) async {
  final doc = FirebaseFirestore.instance.collection(collectionId).doc();
  await doc.set(json);
}

// R: READ
Future<Map<String, dynamic>> getDocument(
    {required String codigo, required String collectionId}) async {
  Map<String, dynamic> doc = {};
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection(collectionId)
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    doc = document.data();
  }
  return doc;
}

Future<List<Map<String, dynamic>>> getDocuments(
    {required String collectionId}) async {
  List<Map<String, dynamic>> docs = [];
  QuerySnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection(collectionId).get();
  for (var document in snapshot.docs) {
    Map<String, dynamic> data = document.data();
    data['id'] = document.id;
    docs.add(data);
  }
  return docs;
}

// U: UPDATE
Future updateDocument(
    {required String codigo,
    required String collectionId,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection(collectionId)
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// D: DELETE
Future deleteDocument(
    {required String codigo, required String collectionId}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection(collectionId)
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.delete();
  }
}

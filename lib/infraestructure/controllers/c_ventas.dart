import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leya080203/domain/entities/ventas.dart';

import 'package:leya080203/infraestructure/controllers/conexion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// nuevo
Future<List> getListaVentas() async {
//Letura de datos
  List lista = [];
  CollectionReference collectionReference = db.collection('Ventas');
  QuerySnapshot querySnapshot = await collectionReference.get();
  querySnapshot.docs.forEach((element) {
    lista.add(element.data());
  });
  Future.delayed(const Duration(seconds: 5));
  return lista;
}

// U: UPDATE
Future updateUsuario(
    {required String codigo,
    required String field,
    required String newValue}) async {
  QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('Ventas')
      .where('codigo', isEqualTo: codigo)
      .get();
  for (var document in snapshot.docs) {
    document.reference.update({field: newValue});
  }
}

// nuevo

Future<void> addVenta(Ventas newVenta) async {
  await db
      .collection('Ventas')
      .add({
        'cod_usuario': newVenta.Cod_usuario,
        'codigo': newVenta.Codigo,
        'concepto': newVenta.Concepto,
        'importe': newVenta.Importe,
      }) //  agregar todos los campos de ventas
      .whenComplete(() => print("Agregado Correctamente"))
      .catchError((err) => print("Error: " + err));
}

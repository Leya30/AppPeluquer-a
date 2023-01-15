import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:leya080203/domain/entities/reservaciones.dart';
import 'package:leya080203/infraestructure/controllers/conexion.dart';

Future<List<Map<String, dynamic>>> getreservaciones() async {
  return await getDocuments(collectionId: 'Reservaciones');
}

Future<List<reservaciones>> getreservacionesEntity() async {
  return (await getreservaciones())
      .map((e) => reservaciones.fromJson(e))
      .toList();
}

Future<void> updateEstadoReservacion(
    String estado, String idReservacion) async {
  await db
      .collection('Reservaciones')
      .doc(idReservacion)
      .update({'estado': estado});
}

//registrar reservaciones
Future<void> addReservacion(Reservaciones newReservacion) async {
  await db
      .collection('Reservaciones')
      .add({
        'cod_servicio': newReservacion.Cod_servicio,
        'cod_usuario': newReservacion.Cod_usuario,
        'codigo': newReservacion.Codigo,
        'fecha': newReservacion.Fecha,
        'hora': newReservacion.Hora,
      }) //  agregar todos los campos de ventas
      .whenComplete(() => print("Agregado Correctamente"))
      .catchError((err) => print("Error: " + err));
}

Future<List<Map<String, dynamic>>> getReservacioneslist() async {
  return await getDocuments(collectionId: 'Reservaciones');
}

// nuevo
// Future<List> getListaReservacionesUsuario() async {
// //Letura de datos
//   List lista = [];
//   CollectionReference collectionReference = db.collection('Reservaciones');
//   QuerySnapshot querySnapshot = await collectionReference.get();
//   querySnapshot.docs.forEach((element) {
//     lista.add(element.data());
//   });
//   Future.delayed(const Duration(seconds: 5));
//   return lista;
// }

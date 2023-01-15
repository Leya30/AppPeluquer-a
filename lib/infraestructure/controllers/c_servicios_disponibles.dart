import 'package:flutter/material.dart';
import 'package:leya080203/domain/entities/servicios_disponibles.dart';
import 'package:leya080203/infraestructure/controllers/conexion.dart';

Future<List<Map<String, dynamic>>> getServicios() async {
  return await getDocuments(collectionId: 'servicios_ofrecidos');
}

Future<List<servicios_disponibles>> getServiciosEntity() async {
  return (await getServicios())
      .map((e) => servicios_disponibles.fromJson(e))
      .toList();
}

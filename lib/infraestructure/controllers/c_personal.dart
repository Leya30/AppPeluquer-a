import 'package:flutter/material.dart';
import 'package:leya080203/domain/entities/personal.dart';
import 'package:leya080203/infraestructure/controllers/conexion.dart';
import 'package:leya080203/domain/entities/personal.dart';

Future<List<Map<String, dynamic>>> getPersonal() async {
  return await getDocuments(collectionId: 'Personal');
}

Future<List<Personal>> getPersonalEntity() async {
  return (await getPersonal()).map((e) => Personal.fromJson(e)).toList();
}

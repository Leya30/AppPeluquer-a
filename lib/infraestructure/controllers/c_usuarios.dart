import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leya080203/domain/entities/usuarios.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addUsuario(String tabla, Usuarios dato) async {
  await db.collection(tabla).add({
    'apellidos': dato.Apellidos,
    'celular': dato.Celular,
    'codigo': dato.Codigo,
    'distrito': dato.Distrito,
    'correo': dato.Correo,
    'nombres': dato.Nombres,
  });
}

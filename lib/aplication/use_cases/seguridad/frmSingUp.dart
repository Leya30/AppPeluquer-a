// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leya080203/aplication/use_cases/frmPrincipal_usuarios.dart';
import 'package:leya080203/domain/entities/usuarios.dart';
import 'package:leya080203/infraestructure/controllers/c_usuarios.dart';
import 'package:leya080203/infraestructure/controllers/conexion.dart';

class frmSingUp extends StatefulWidget {
  const frmSingUp({super.key});

  @override
  State<frmSingUp> createState() => _frmSingUpState();
}

class _frmSingUpState extends State<frmSingUp> {
  TextEditingController txtNombre = TextEditingController();
  TextEditingController txtApellidos = TextEditingController();
  TextEditingController txtDireccion = TextEditingController();
  TextEditingController txtDistrito = TextEditingController();
  TextEditingController txtDNI = TextEditingController();
  TextEditingController txtCorreo = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de usuarios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: txtNombre,
              decoration: InputDecoration(hintText: 'Nombres'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtApellidos,
              decoration: InputDecoration(hintText: 'Apellidos'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtDistrito,
              decoration: InputDecoration(hintText: 'Distrito'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtDNI,
              decoration: InputDecoration(hintText: 'DNI'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtCorreo,
              decoration: InputDecoration(hintText: 'Correo'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtPassword,
              decoration: InputDecoration(hintText: 'Contraseña'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: txtCorreo.text.toString(),
                          password: txtPassword.text.toString())
                      .then((value) {
                    addUsuario(
                        'Usuarios',
                        Usuarios(
                            txtNombre.text,
                            txtApellidos.text,
                            txtDireccion.text,
                            txtDistrito.text,
                            txtDNI.text,
                            txtCorreo.text));
                    toastmessage("Guardado Correctamente");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => frmPrincipal()));
                  }).onError((error, stackTrace) {
                    print("error");
                    toastmessage(error.toString());
                  });
                },
                child: Text('Registrar'))
          ],
        ),
      ),
    );
  }
}

void toastmessage(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.amber,
    textColor: Colors.white,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 4,
  );
}

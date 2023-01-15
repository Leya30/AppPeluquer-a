// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:leya080203/aplication/use_cases/frmPersonal.dart';
import 'package:leya080203/aplication/use_cases/frmReservaciones_usuarios.dart';
import 'package:leya080203/aplication/use_cases/seguridad/frmSegLogin.dart';
import 'package:leya080203/infraestructure/controllers/conexion.dart';
import 'package:leya080203/aplication/use_cases/frmServicios_disponibles.dart';

class frmPrincipal extends StatefulWidget {
  State<frmPrincipal> createState() => _frmPrincipal();
}

// ignore: camel_case_types
class _frmPrincipal extends State<frmPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 248, 203, 1),
              Color.fromARGB(255, 240, 141, 141)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Servicios_disponibles()),
                );
              }),
              child: Text("1 - Servicios"),
            ),
            SizedBox(
              height: 22,
            ),
            ElevatedButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => frmReservaciones_usuarios()),
                );
              }),
              child: Text("2 - Reservaciones"),
            ),
            SizedBox(
              height: 22,
            ),
            SizedBox(
              height: 22,
            ),
            ElevatedButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text("6 - Salir"),
            ),
          ],
        ),
      ),
    );
  }
}

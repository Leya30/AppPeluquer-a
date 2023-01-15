import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leya080203/aplication/use_cases/frmPrincipal_personal.dart';
import 'package:leya080203/aplication/use_cases/frmPrincipal_usuarios.dart';
import 'package:leya080203/aplication/use_cases/seguridad/frmSingUp.dart';
import 'package:leya080203/widgets/icon container.dart';

class frmSegLogin_personal extends StatefulWidget {
  const frmSegLogin_personal({super.key});

  @override
  State<frmSegLogin_personal> createState() => _frmSegLogin_personalState();
}

class _frmSegLogin_personalState extends State<frmSegLogin_personal> {
  TextEditingController txtCorreo = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 248, 203, 1),
                  Color.fromARGB(255, 240, 141, 141),
                ], begin: Alignment.topCenter),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 200),
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconContainer(
                        url: 'images/imagen2.png',
                      ),
                      Text(
                        'Login',
                        style: TextStyle(fontFamily: 'Angellya', fontSize: 40),
                      ),
                      Divider(
                        height: 10,
                      ),
                      TextField(
                        controller: txtCorreo,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'correo',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 83, 81, 81),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onChanged: (value) {},
                      ),
                      Divider(
                        height: 10,
                      ),
                      TextField(
                        controller: txtPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.key),
                            hintText: 'Contraseña',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 83, 81, 81),
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onChanged: (value) {},
                      ),
                      Divider(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: (() {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: (txtCorreo.text.toString()).trim(),
                                    password: txtPassword.text.toString())
                                .then((value) {
                              toastmessage("Inicio correcto");
                              print("sesion correcta");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          frmPrincipal_personal()));
                            }).catchError((error, stackTrace) {
                              toastmessage("Correo o contrasenia incorrecto");
                            });
                          }),
                          child: Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Angellya',
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

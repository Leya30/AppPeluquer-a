import 'package:flutter/material.dart';
import 'package:leya080203/aplication/use_cases/frmPrincipal_personal.dart';
import 'package:leya080203/aplication/use_cases/seguridad/frmSegLogin_pesonal.dart';
import 'package:leya080203/aplication/use_cases/seguridad/frmSingUp.dart';
import 'package:leya080203/aplication/use_cases/seguridad/frmSegLogin.dart';
import 'package:leya080203/widgets/icon container.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _home();
}

class _home extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Bienvenido(a)',
                      style: TextStyle(fontFamily: 'Angellya', fontSize: 40),
                    ),
                    Divider(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                              builder: (context) => frmSegLogin());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          'Ingresar como cliente',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Angellya',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                              builder: (context) => frmSingUp());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          'Registrarse como cliente',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Angellya',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          final route = MaterialPageRoute(
                              builder: (context) => frmSegLogin_personal());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          'Ingresar como personal',
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
    );
  }
}

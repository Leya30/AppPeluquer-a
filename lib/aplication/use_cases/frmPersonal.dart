import 'package:flutter/material.dart';
import 'package:leya080203/aplication/use_cases/frmPrincipal_usuarios.dart';
import 'package:leya080203/domain/entities/personal.dart';
import 'package:leya080203/infraestructure/controllers/c_personal.dart';

class frmPersonal extends StatefulWidget {
  const frmPersonal({super.key});

  @override
  State<frmPersonal> createState() => _frmPersonalState();
}

class _frmPersonalState extends State<frmPersonal> {
  @override
  void initState() {
    depuracion();
    super.initState();
  }

  Future depuracion() async {
    print('Mirar aquí');
    print(await getPersonalEntity());
  }

  Future<List<Personal>> getPersonalList() async {
    return await getPersonalEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Personal')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color.fromARGB(255, 255, 255, 255),
                Colors.white
              ]),
        ),
        child: FutureBuilder(
          future: getPersonalList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PersonalCard(
                      apellidos: snapshot.data![index].Apellidos,
                      celular: snapshot.data![index].Celular,
                      codigo: snapshot.data![index].Codigo,
                      dni: snapshot.data![index].DNI,
                      email: snapshot.data![index].Email,
                      nombres: snapshot.data![index].Nombres);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class PersonalCard extends StatelessWidget {
  final String apellidos;
  final String celular;
  final String codigo;
  final String dni;
  final String email;
  final String nombres;

  const PersonalCard({
    Key? key,
    required this.apellidos,
    required this.celular,
    required this.codigo,
    required this.dni,
    required this.email,
    required this.nombres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color.fromARGB(255, 122, 8, 41),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(apellidos,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ],
              ),
              Row(
                children: [
                  Text(
                    celular,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    codigo,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    dni,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    nombres,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:leya080203/domain/entities/servicios_disponibles.dart';
import 'package:leya080203/infraestructure/controllers/c_servicios_disponibles.dart';

class Servicios_disponibles extends StatefulWidget {
  const Servicios_disponibles({super.key});

  @override
  State<Servicios_disponibles> createState() => _Servicios_disponiblesState();
}

class _Servicios_disponiblesState extends State<Servicios_disponibles> {
  @override
  void initState() {
    depuracion();
    super.initState();
  }

  Future depuracion() async {
    print('Mirar aquí');
    print(await getServiciosEntity());
  }

  Future<List<servicios_disponibles>> getServiciosList() async {
    return await getServiciosEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Servicios ofrecidos')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color.fromARGB(255, 143, 32, 32),
                Color.fromARGB(255, 118, 2, 48)
              ]),
        ),
        child: FutureBuilder(
          future: getServiciosList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ServicioCard(
                    codigo: snapshot.data![index].Codigo,
                    descripcion: snapshot.data![index].Descripcion,
                    disponibilidad: snapshot.data![index].Disponibilidad,
                    imagen: snapshot.data![index].Imagen,
                    nombre: snapshot.data![index].Nombre,
                    precio: snapshot.data![index].Precio,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ServicioCard extends StatelessWidget {
  final String codigo;
  final String descripcion;
  final String disponibilidad;
  final String imagen;
  final String nombre;
  final String precio;

  const ServicioCard(
      {Key? key,
      required this.codigo,
      required this.descripcion,
      required this.disponibilidad,
      required this.nombre,
      required this.precio,
      required this.imagen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color.fromARGB(255, 90, 6, 25),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(codigo,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ],
              ),
              Image.network(imagen,
                  width: 350, fit: BoxFit.fitWidth, height: 250),
              Row(
                children: [
                  Text(
                    nombre,
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
                    disponibilidad,
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
                    precio,
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
                    descripcion,
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

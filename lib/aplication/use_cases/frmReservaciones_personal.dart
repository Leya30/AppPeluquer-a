// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:leya080203/domain/entities/reservaciones.dart';
import 'package:leya080203/infraestructure/controllers/c_reservaciones.dart';

class frmReservaciones_personal extends StatefulWidget {
  const frmReservaciones_personal({super.key});

  @override
  State<frmReservaciones_personal> createState() =>
      _frmReservaciones_personal();
}

class _frmReservaciones_personal extends State<frmReservaciones_personal> {
  @override
  void initState() {
    depuracion();
    super.initState();
  }

  Future depuracion() async {
    print('Mirar aquí');
    print(await getreservacionesEntity());
  }

  Future<List<reservaciones>> getReservacionesList() async {
    return await getreservacionesEntity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Reservaciones')),
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
          future: getReservacionesList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print('DATA: ${snapshot.data}');
                  return ReservacionesCard(
                    id: snapshot.data![index].GetID,
                    cod_servicio: snapshot.data![index].Cod_servicio,
                    cod_usuario: snapshot.data![index].Cod_usuario,
                    codigo: snapshot.data![index].Codigo,
                    estado: snapshot.data![index].Estado,
                    fecha: snapshot.data![index].Fecha,
                    hora: snapshot.data![index].Hora,
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

class ReservacionesCard extends StatefulWidget {
  final String id;
  final String cod_servicio;
  final String cod_usuario;
  final String codigo;
  final String estado;
  final String fecha;
  final String hora;

  const ReservacionesCard({
    Key? key,
    required this.id,
    required this.cod_servicio,
    required this.cod_usuario,
    required this.codigo,
    required this.estado,
    required this.fecha,
    required this.hora,
  }) : super(key: key);

  @override
  State<ReservacionesCard> createState() => _ReservacionesCardState();
}

class _ReservacionesCardState extends State<ReservacionesCard> {
  bool status = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.status = widget.estado == 'pendiente' ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color.fromARGB(255, 112, 7, 32),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.cod_servicio,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.cod_usuario,
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
                    widget.codigo,
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
                    status ? 'reservado' : 'pendiente',
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
                    widget.fecha,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 247, 247, 247)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.hora,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 247, 247, 247)),
                  ),
                ],
              ),
              Row(
                children: [
                  FlutterSwitch(
                    width: 85.0,
                    height: 35.0,
                    valueFontSize: 15.0,
                    toggleSize: 15.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) async {
                      status = val;
                      await updateEstadoReservacion(
                              status == true ? 'reservado' : 'pendiente',
                              widget.id)
                          .then((value) => {
                                print('Actualizado a $status'),
                              });
                      setState(() {});
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

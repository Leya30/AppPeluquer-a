import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:leya080203/domain/entities/reservaciones.dart';
import 'package:leya080203/infraestructure/controllers/c_reservaciones.dart';
import 'package:toggle_switch/toggle_switch.dart';

class frmReservaciones_usuarios extends StatefulWidget {
  const frmReservaciones_usuarios({super.key});

  @override
  State<frmReservaciones_usuarios> createState() =>
      _frmReservaciones_usuariosState();
}

class _frmReservaciones_usuariosState extends State<frmReservaciones_usuarios> {
  @override
  void initState() {
    depuracion();
    super.initState();
  }

  Future depuracion() async {
    print('Mirar aquí');
    print(await getreservacionesEntity());
  }

  int _activeIndex = 0;

  final cod_servicio = TextEditingController();
  final cod_usuario = TextEditingController();
  final codigo = TextEditingController();
  final estado = TextEditingController();
  final fecha = TextEditingController();
  final hora = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reservaciones'),
        ),
        body: toggle(context));
  }

  Future<List<reservaciones>> getReservacionesList() async {
    print(getreservacionesEntity());
    return await getreservacionesEntity();
  }

  toggle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ToggleSwitch(
            minWidth: 170,
            initialLabelIndex: _activeIndex,
            activeBgColors: const [
              [Color.fromARGB(255, 187, 166, 249)],
              [Color.fromARGB(255, 248, 220, 144)]
            ],
            activeFgColor: Colors.black,
            inactiveBgColor: Colors.white,
            inactiveFgColor: Colors.black,
            labels: ['Nuevo', 'Lista'],
            onToggle: (index) {
              setState(() {
                _activeIndex = index ?? 0;
              });
            },
          ),
        ),
        if (_activeIndex == 0) ContainerNuevo() else ContainerLista(context)
      ],
    );
  }

  ContainerLista(BuildContext context) {
    return Flexible(
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
    );
  }

  ContainerNuevo() {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: cod_servicio,
            decoration: InputDecoration(hintText: 'Codigo servicio'),
          ),
          TextField(
            controller: cod_usuario,
            decoration: InputDecoration(hintText: 'Codigo usuario'),
          ),
          TextField(
            controller: codigo,
            decoration: InputDecoration(hintText: 'Codigo'),
          ),
          TextField(
            controller: fecha,
            decoration: InputDecoration(hintText: 'Fecha'),
          ),
          TextField(
            controller: hora,
            decoration: InputDecoration(hintText: 'Hora'),
          ),
          ElevatedButton(
              onPressed: () {
                addReservacion(Reservaciones(
                  cod_servicio.text,
                  cod_usuario.text,
                  codigo.text,
                  fecha.text,
                  hora.text,
                ));
              },
              child: Text('Guardar'))
        ],
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
            ],
          ),
        ),
      ),
    );
  }
}

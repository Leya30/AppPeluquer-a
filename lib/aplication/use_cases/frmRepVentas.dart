import 'package:flutter/material.dart';
import 'package:leya080203/domain/entities/ventas.dart';
import 'package:leya080203/infraestructure/controllers/c_ventas.dart';
import 'package:toggle_switch/toggle_switch.dart';

class frmRepVentas extends StatefulWidget {
  const frmRepVentas({super.key});

  @override
  State<frmRepVentas> createState() => _frmRepVentasState();
}

class _frmRepVentasState extends State<frmRepVentas> {
  int _activeIndex = 1;
  final cod_usuario = TextEditingController();
  final codigo = TextEditingController();
  final concepto = TextEditingController();
  final importe = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ventas'),
        ),
        body: toggle(context));
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
          future: getListaVentas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // calcularBalance(snapshot);
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  print('DATA: ${snapshot.data}');
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.room_service,
                        color: Colors.blue,
                      ),
                      trailing: Text(
                        'S/. ${snapshot.data?[index]['importe'].toString()}',
                        style: TextStyle(fontSize: 20),
                      ),
                      title: Text(
                        snapshot.data?[index]['concepto'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    ),
                  );
                }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  ContainerNuevo() {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: cod_usuario,
            decoration: InputDecoration(hintText: 'Codigo de usuario'),
          ),
          TextField(
            controller: codigo,
            decoration: InputDecoration(hintText: 'Codigo venta'),
          ),
          TextField(
            controller: concepto,
            decoration: InputDecoration(hintText: 'Concepto'),
          ),
          TextField(
            controller: importe,
            decoration: InputDecoration(hintText: 'Importe'),
          ),
          ElevatedButton(
              onPressed: () {
                addVenta(Ventas(cod_usuario.text, codigo.text, concepto.text,
                    importe.text));
              },
              child: Text('Guardar'))
        ],
      ),
    );
  }
}

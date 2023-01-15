class reservaciones {
  // ignore: unused_field
  String _id = '',
      _cod_servicio = '',
      _cod_usuario = '',
      _codigo = '',
      _estado = '',
      _fecha = '',
      _hora = '';

  reservaciones({
    required String id,
    required String cod_servicio,
    required String cod_usuario,
    required String codigo,
    required String estado,
    required String fecha,
    required String hora,
  }) {
    _id = id;
    _cod_servicio = cod_servicio;
    _cod_usuario = cod_usuario;
    _codigo = codigo;
    _estado = estado;
    _fecha = fecha;
    _hora = hora;
  }

  String get GetID {
    return _id;
  }

  set GetID(String id) {
    _id = id;
  }

  String get Cod_servicio {
    return _cod_servicio;
  }

  set Cod_servicio(String cods) {
    _cod_servicio = cods;
  }

  String get Cod_usuario {
    return _cod_usuario;
  }

  set Cod_usuario(String codu) {
    _cod_usuario = codu;
  }

  String get Codigo {
    return _codigo;
  }

  set Codigo(String cod) {
    _codigo = cod;
  }

  String get Estado {
    return _estado;
  }

  set Estado(String est) {
    _estado = est;
  }

  String get Fecha {
    return _fecha;
  }

  set Fecha(String fec) {
    _fecha = fec;
  }

  String get Hora {
    return _hora;
  }

  set Hora(String hora) {
    _hora = hora;
  }

  static reservaciones fromJson(Map<String, dynamic> json) {
    return reservaciones(
      id: json['id'],
      cod_servicio: json['cod_servicio'],
      cod_usuario: json['cod_usuario'],
      codigo: json['codigo'],
      estado: json['estado'],
      fecha: json['fecha'],
      hora: json['hora'],
    );
  }

  @override
  String toString() {
    return 'Entregable(_id: $_id, _cod_servicio: $_cod_servicio, _cod_usuario: $_cod_usuario, _estado: $_estado, _fecha: $_fecha, _hora: $_hora)';
  }
}

class Reservaciones {
  // ignore: unused_field
  String _cod_servicio = '',
      _cod_usuario = '',
      _codigo = '',
      _fecha = '',
      _hora = '';

  Reservaciones(
    String cod_servicio,
    String cod_usuario,
    String codigo,
    String fecha,
    String hora,
  ) {
    _cod_servicio = cod_servicio;
    _cod_usuario = cod_usuario;
    _codigo = codigo;
    _fecha = fecha;
    _hora = hora;
  }

  String get Cod_servicio {
    return _cod_servicio;
  }

  set Cod_servicio(String cods) {
    _cod_servicio = cods;
  }

  String get Cod_usuario {
    return _cod_usuario;
  }

  set Cod_usuario(String codu) {
    _cod_usuario = codu;
  }

  String get Codigo {
    return _codigo;
  }

  set Codigo(String cod) {
    _codigo = cod;
  }

  String get Fecha {
    return _fecha;
  }

  set Fecha(String fec) {
    _fecha = fec;
  }

  String get Hora {
    return _hora;
  }

  set Hora(String hor) {
    _hora = hor;
  }
}

class servicios_disponibles {
  // ignore: unused_field
  String _codigo = '',
      _descripcion = '',
      _disponibilidad = '',
      _imagen = '',
      _nombre = '',
      _precio = '';

  servicios_disponibles({
    required String codigo,
    required String descripcion,
    required String disponibilidad,
    required String imagen,
    required String nombre,
    required String precio,
  }) {
    _codigo = codigo;
    _descripcion = descripcion;
    _disponibilidad = disponibilidad;
    _imagen = imagen;
    _nombre = nombre;
    _precio = precio;
  }

  String get Codigo {
    return _codigo;
  }

  set Codigo(String cod) {
    _codigo = cod;
  }

  String get Descripcion {
    return _descripcion;
  }

  set Descripcion(String desc) {
    _descripcion = desc;
  }

  String get Disponibilidad {
    return _disponibilidad;
  }

  set Disponibilidad(String disp) {
    _disponibilidad = disp;
  }

  String get Imagen {
    return _imagen;
  }

  set Imagen(String img) {
    _imagen = img;
  }

  String get Nombre {
    return _nombre;
  }

  set Nombre(String nom) {
    _nombre = nom;
  }

  String get Precio {
    return _precio;
  }

  set Precio(String pre) {
    _precio = pre;
  }

  static servicios_disponibles fromJson(Map<String, dynamic> json) {
    return servicios_disponibles(
      codigo: json['codigo'],
      descripcion: json['descripcion'],
      disponibilidad: json['disponibilidad'],
      imagen: json['imagen'],
      nombre: json['nombre'],
      precio: json['precio'],
    );
  }

  @override
  String toString() {
    return 'Entregable(_codigo: $_codigo,_descripcion: $_descripcion, _imagen: $_imagen, _disponibilidad: $_disponibilidad, _nombre: $_nombre, _precio: $_precio,   )';
  }
}

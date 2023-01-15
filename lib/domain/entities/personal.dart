class Personal {
  // ignore: unused_field
  String _apellidos = '',
      _celular = '',
      _codigo = '',
      _dni = '',
      _email = '',
      _nombres = '';

  Personal(
      {required String apellidos,
      required String celular,
      required String codigo,
      required String dni,
      required String email,
      required String nombres}) {
    _apellidos = apellidos;
    _codigo = codigo;
    _celular = celular;
    _dni = dni;
    _email = email;
    _nombres = nombres;
  }

  String get Apellidos {
    return _apellidos;
  }

  set Apellidos(String appe) {
    _apellidos = appe;
  }

  String get Celular {
    return _celular;
  }

  set Celular(String cel) {
    _celular = cel;
  }

  String get Codigo {
    return _codigo;
  }

  set Codigo(String cod) {
    _codigo = cod;
  }

  String get DNI {
    return _dni;
  }

  set DNI(String dn) {
    _dni = dn;
  }

  String get Email {
    return _email;
  }

  set Email(String em) {
    _email = em;
  }

  String get Nombres {
    return _nombres;
  }

  set Nombres(String nom) {
    _nombres = nom;
  }

  static Personal fromJson(Map<String, dynamic> json) {
    return Personal(
      apellidos: json['apellidos'],
      celular: json['celular'],
      codigo: json['codigo'],
      dni: json['dni'],
      email: json['email'],
      nombres: json['nombres'],
    );
  }

  @override
  String toString() {
    return 'Entregable(_apellidos: $_apellidos, _celular: $_celular, _codigo: $_codigo, _dni: $_dni, _email: $_email, _nombres: $_nombres )';
  }
}

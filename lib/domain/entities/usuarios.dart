class Usuarios {
  // ignore: unused_field
  String _apellidos = '',
      _celular = '',
      _codigo = '',
      _distrito = '',
      _correo = '',
      _nombres = '';

  Usuarios(String apellidos, String celular, String codigo, String distrito,
      String correo, String nombres) {
    _apellidos = apellidos;
    _celular = celular;
    _codigo = codigo;
    _distrito = distrito;
    _correo = correo;
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

  String get Distrito {
    return _distrito;
  }

  set Distrito(String dis) {
    _distrito = dis;
  }

  String get Correo {
    return _correo;
  }

  set Correo(String cor) {
    _correo = cor;
  }

  String get Nombres {
    return _nombres;
  }

  set Nombres(String nom) {
    _nombres = nom;
  }
}

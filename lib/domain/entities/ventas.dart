class Ventas {
  // ignore: unused_field
  String _cod_usuario = '', _codigo = '', _concepto = '', _importe = '';

  Ventas(
    String cod_usuario,
    String codigo,
    String concepto,
    String importe,
  ) {
    _cod_usuario = cod_usuario;
    _codigo = codigo;
    _concepto = concepto;
    _importe = importe;
  }

  String get Cod_usuario {
    return _cod_usuario;
  }

  set Cod_usuario(String cod_usuario) {
    _cod_usuario = cod_usuario;
  }

  String get Codigo {
    return _codigo;
  }

  set Codigo(String codigo) {
    _codigo = codigo;
  }

  String get Concepto {
    return _concepto;
  }

  set Concepto(String concepto) {
    _concepto = concepto;
  }

  String get Importe {
    return _importe;
  }

  set Importe(String importe) {
    _importe = importe;
  }
}

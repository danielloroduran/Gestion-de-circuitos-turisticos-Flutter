class PuntoInteres{
  
  String _nombre;
  String _tipo;
  String _foto;
  String _entrada;
  String _descripcion;
  String _direccion;
  String _horario;
  String _duracionVisita;
  bool _seleccionado = false;

  PuntoInteres(String nombre, String tipo, String foto, String entrada, String descripcion, String direccion, String horario, String duracionVisita){
    this._nombre = nombre;
    this._tipo = tipo;
    this._foto = foto;
    this._entrada = entrada;
    this._descripcion = descripcion;
    this._direccion = direccion;
    this._horario = horario;
    this._duracionVisita = duracionVisita;

  }

  String get nombre => _nombre;
  String get tipo => _tipo;
  String get foto => _foto;
  String get entrada => _entrada;
  String get descripcion => _descripcion;
  String get direccion => _direccion;
  String get horario => _horario;
  String get duracionVisita => _duracionVisita;
  bool get seleccionado => _seleccionado;

  set nombre(String nombre) => _nombre = nombre;
  set tipo(String tipo) => _tipo = tipo;
  set entrada(String entrada) => _entrada = entrada;
  set descripcion(String descripcion) => _descripcion = descripcion;
  set direccion(String direccion) => _direccion = direccion;
  set horario(String horario) => _horario = horario;
  set duracionVisita(String duracionVisita) => _duracionVisita = duracionVisita;
  set foto(String foto) => _foto = foto;
  set seleccionado(bool seleccionado) => _seleccionado = seleccionado;

 Map<String, dynamic> toMap(){
    return {
      'nombre': _nombre,
      'tipo': _tipo,
      'foto': _foto,
      'entrada': _entrada,
      'descripcion': _descripcion,
      'direccion': _direccion,
      'horario': _horario,
      'duracionVisita': _duracionVisita,
    };
  }
}
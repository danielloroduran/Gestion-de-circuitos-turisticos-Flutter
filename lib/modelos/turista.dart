class Turista{

  String _nombre;
  String _apellidos;
  int _movil;
  String _dni;
  String _correo;
  String _foto;
  bool _seleccionado = false;
  int _edad; 

  Turista(String dni, String nombre, String apellidos, int movil, String correo, String foto, int edad){

    this._nombre = nombre;
    this._apellidos = apellidos;
    this._movil = movil;
    this._dni = dni;
    this._correo = correo;
    this._foto = foto;
    this._edad = edad;
  }


  String get nombre => _nombre;
  String get apellidos => _apellidos;
  int get movil => _movil;
  String get dni => _dni;
  String get correo => _correo;
  String get foto => _foto;
  int get edad => _edad;
  bool get seleccionado => _seleccionado; 



  set nombre(String nombre) => _nombre = nombre;
  set apellidos(String apellidos) => _apellidos = apellidos;
  set movil(int movil) => _movil = movil;
  set dni(String dni) => _dni = dni;
  set correo(String correo) => _correo = correo;
  set foto(String foto) => _foto = foto;
  set edad(int edad) => _edad = edad;
  set seleccionado(bool seleccionado) => _seleccionado = seleccionado;

   Map<String, dynamic> toMap(){
    return {
      'DNI': _dni,
      'nombre': _nombre,
      'apellidos': _apellidos,
      'movil': _movil,
      'correo': _correo,
      'foto': _foto,
      'edad': _edad
    };
  }


}
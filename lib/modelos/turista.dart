class Turista{

  String _nombre;
  String _apellidos;
  int _telefono;
  String _dni;
  String _correo;
  String _foto;
  int _edad; 

  Turista(String nombre, String apellidos, int telefono, String dni, String correo, String foto, int edad){

    this._nombre = nombre;
    this._apellidos = apellidos;
    this._telefono = telefono;
    this._dni = dni;
    this._correo = correo;
    this._foto = foto;
    this._edad = edad;
  }


  String get nombre => _nombre;
  String get apellidos => _apellidos;
  int get telefono => _telefono;
  String get dni => _dni;
  String get correo => _correo;
  String get foto => _foto;
  int get edad => _edad; 



  set nombre(String nombre) => _nombre = nombre;
  set apellidos(String apellidos) => _apellidos = apellidos;
  set telefono(int telefono) => _telefono = telefono;
  set dni(String dni) => _dni = dni;
  set correo(String correo) => _correo = correo;
  set foto(String foto) => _foto = foto;
  set edad(int edad) => _edad = edad;


}
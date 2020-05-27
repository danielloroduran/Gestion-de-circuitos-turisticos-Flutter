import 'package:practica_ipo2/modelos/ruta.dart';

class Guia{
  String _nombre;
  String _apellidos;
  int _movil;
  String _foto;
  int _puntuacion;
  String _idiomas;
  String _disponibilidad;
  double _precioHora;
  double _precioDia;
  String _dni;
  String _correo;
  List<Ruta> _rutasAsignadas;
  List<Ruta> _rutasHistorial;
  
  Guia.enBlanco(){
    this._nombre = "";
    this._apellidos = "";
    this._movil = 0;
    this._foto = "";
    this._puntuacion = 0;
    this._idiomas = "";
    this._disponibilidad = "";
    this._precioHora = 0.0;
    this._precioDia = 0.0;
    this._dni = "";
    this._correo = "";
    this._rutasAsignadas = new List<Ruta>();
    this._rutasHistorial = new List<Ruta>();
  }

  Guia(String dni, String nombre, String apellidos, int movil, String foto, int puntuacion, String idiomas, String disponibilidad, double precioHora, double precioDia,  String correo){
    this._nombre = nombre;
    this._apellidos = apellidos;
    this._movil = movil;
    this._foto = foto;
    this._puntuacion = puntuacion;
    this._idiomas = idiomas;
    this._disponibilidad = disponibilidad;
    this._precioHora = precioHora;
    this._precioDia = precioDia;
    this._dni = dni;
    this._correo = correo;
    this._rutasAsignadas = new List<Ruta>();
    this._rutasHistorial = new List<Ruta>();
  }

  String get nombre => _nombre;
  String get apellidos => _apellidos;
  int get movil => _movil;
  String get foto => _foto;
  int get puntuacion => _puntuacion;
  String get idiomas => _idiomas;
  String get disponibilidad => _disponibilidad;
  double get precioHora => _precioHora;
  double get precioDia => _precioDia;
  String get dni => _dni;
  String get correo => _correo;
  List get rutasAsignadas => _rutasAsignadas;
  List get rutasHistorial => _rutasHistorial;

  set nombre(String nombre) => _nombre = nombre;
  set apellidos(String apellidos) => _apellidos = apellidos;
  set movil(int movil) => _movil = movil;
  set foto(String foto) => _foto = foto;
  set puntuacion(int puntuacion) => _puntuacion = puntuacion;
  set idiomas(String idiomas) => _idiomas = idiomas;
  set disponibilidad(String disponibilidad) => _disponibilidad = disponibilidad;
  set precioHora(double precioHora) => _precioHora = precioHora;
  set precioDia(double precioDia) => _precioDia = precioDia;
  set dni(String dni) => _dni = dni;
  set correo(String correo) => _correo = correo;
  set rutasAsignadas(List<Ruta> rutasAsignadas) => _rutasAsignadas = rutasAsignadas;
  set rutasHistorial(List<Ruta> rutasHistorial) => _rutasHistorial = rutasHistorial;

  Map<String, dynamic> toMap(){
    return {
      'DNI': _dni,
      'nombre': _nombre,
      'apellidos': _apellidos,
      'movil': _movil,
      'foto': _foto,
      'puntuacion': _puntuacion,
      'idiomas': _idiomas,
      'disponibilidad': disponibilidad,
      'precioHora': _precioHora,
      'precioDia': _precioDia,
      'correo': _correo,
    };
  }

}
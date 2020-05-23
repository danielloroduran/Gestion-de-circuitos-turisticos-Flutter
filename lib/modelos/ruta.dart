
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';

class Ruta{
  
  String _nombre;
  String _estado;
  double _coste;
  int _personas;
  String _opiniones;
  String _sugerencias;
  String _localidad;
  String _horaInicio;
  String _horaFin;
  String _fecha;
  int _reserva;
  int _puntuacion;
  String _foto;
  bool _seleccionado = false;
  List<PuntoInteres> _puntoInteres;
  List<GrupoTurista> _grupoTurista;

  int _turistasTotal = 0;

  Ruta(String nombre, String estado, double coste, String opiniones, String sugerencias, String localidad, String horaInicio, String horaFin, String foto, String fecha, int reserva, int puntuacion) {
    this._nombre = nombre;
    this._estado = estado;
    this._coste = coste;
    this._opiniones = opiniones;
    this._sugerencias = sugerencias;
    this._localidad = localidad;
    this._horaInicio = horaInicio;
    this._horaFin = horaFin;
    this._fecha = fecha;
    this._reserva = reserva;
    this._foto = foto;
    this._puntuacion = puntuacion;
    this._puntoInteres = new List<PuntoInteres>();
    this._grupoTurista = new List<GrupoTurista>();
  }

  String get nombre => _nombre;
  String get estado => _estado;
  double get coste => _coste;
  int get personas => _personas;
  String get opiniones => _opiniones;
  String get sugerencias => _sugerencias;
  String get localidad => _localidad;
  String get horaInicio => _horaInicio;
  String get horaFin => _horaFin;
  String get fecha => _fecha;
  int get reserva => _reserva;
  String get foto => _foto;
  int get puntuacion => _puntuacion;
  bool get seleccionado => _seleccionado;
  List get puntoInteres => _puntoInteres;
  List get grupoTurista => _grupoTurista;

  set nombre(String nombre) => _nombre = nombre;
  set estado(String estado) => _estado = estado;
  set coste(double coste) => _coste = coste;
  set personas(int personas) => _personas = personas;
  set opiniones(String opiniones) => _opiniones = opiniones;
  set sugerencias(String sugerencias) => _sugerencias = sugerencias;
  set localidad(String localidad) => _localidad = localidad;
  set horaInicio(String horaInicio) => _horaInicio = horaInicio;
  set horaFin(String horaFin) => _horaFin = horaFin;
  set fecha(String fecha) => _fecha = fecha;
  set reserva(int reserva) => _reserva = reserva;
  set foto(String foto) => _foto = foto;
  set seleccionado(bool seleccionado) => _seleccionado = seleccionado;
  set puntuacion(int puntuacion) => _puntuacion = puntuacion;
  set puntoInteres(List<PuntoInteres> puntoInteres) => _puntoInteres = puntoInteres;
  set grupoTurista(List<GrupoTurista> grupoTurista) => _grupoTurista = grupoTurista;


  void setTuristasTotal(){
    this._turistasTotal = 0;
    for(int i = 0; i < this._grupoTurista.length;i++){
      this._turistasTotal += this._grupoTurista.elementAt(i).turistas.length;
    }
  }

}
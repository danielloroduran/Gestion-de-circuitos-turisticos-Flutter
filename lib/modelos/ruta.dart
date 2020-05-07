
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';

class Ruta{
  
  String _nombre;
  String _estado;
  String _coste;
  int _personas;
  String _opiniones;
  String _incidencias;
  String _sugerencias;
  String _localidad;
  int _puntuacion;
  String _foto;
  List<PuntoInteres> _puntoInteres;
  List<GrupoTurista> _grupoTurista;

  int _turistasTotal = 0;

  Ruta(String nombre, String estado, String coste, String opiniones, String incidencias, String sugerencias, String localidad, String foto, int puntuacion) {
    this._nombre = nombre;
    this._estado = estado;
    this._coste = coste;
    this._opiniones = opiniones;
    this._incidencias = incidencias;
    this._sugerencias = sugerencias;
    this._localidad = localidad;
    this._foto = foto;
    this._puntuacion = puntuacion;
    this._puntoInteres = new List<PuntoInteres>();
    this._grupoTurista = new List<GrupoTurista>();
  }

  String get nombre => _nombre;
  String get estado => _estado;
  String get coste => _coste;
  int get personas => _personas;
  String get opiniones => _opiniones;
  String get incidencias => _incidencias;
  String get sugerencias => _sugerencias;
  String get localidad => _localidad;
  String get foto => _foto;
  int get puntuacion => _puntuacion;
  List get puntoInteres => _puntoInteres;
  List get grupoTurista => _grupoTurista;

  set nombre(String nombre) => _nombre = nombre;
  set estado(String estado) => _estado = estado;
  set coste(String coste) => _coste = coste;
  set personas(int personas) => _personas = personas;
  set opiniones(String opiniones) => _opiniones = opiniones;
  set incidencias(String incidencias) => _incidencias = incidencias;
  set sugerencias(String sugerencias) => _sugerencias = sugerencias;
  set localidad(String localidad) => _localidad = localidad;
  set foto(String foto) => _foto = foto;
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
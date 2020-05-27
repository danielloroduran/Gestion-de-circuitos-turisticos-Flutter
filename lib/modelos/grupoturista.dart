import 'package:practica_ipo2/modelos/turista.dart';

class GrupoTurista{
  
  String _nombreGrupo;
  int _numIntegrantes;
  List<Turista> _turistas;
  String _tipo;
  String _descripcion;
  String _intereses;
  String _restricciones;
  String _foto;

  GrupoTurista.enBlanco(){
    this._nombreGrupo = "";
    this._tipo = "Estudiantes";
    this._descripcion = "";
    this._intereses = "";
    this._restricciones = "";
    this._foto = "imagenes/grupo.jpg";
    this._turistas = new List<Turista>();
    this._numIntegrantes = this._turistas.length;
  }

  GrupoTurista(String nombreGrupo, String tipo, String descripcion, String intereses, String restricciones, String foto){
    this._nombreGrupo = nombreGrupo;
    this._tipo = tipo;
    this._descripcion = descripcion;
    this._intereses = intereses;
    this._restricciones = restricciones;
    this._foto = foto;
    this._turistas = new List<Turista>();
    this._numIntegrantes = this._turistas.length;
  }

  String get nombreGrupo => _nombreGrupo;
  String get tipo => _tipo;
  String get descripcion => _descripcion;
  String get intereses => _intereses;
  String get restricciones => _restricciones;
  String get foto => _foto;
  int get numIntegrantes => _numIntegrantes;
  List get turistas => _turistas;

  set nombreGrupo(String nombreGrupo) => _nombreGrupo = nombreGrupo;
  set tipo(String tipo) => _tipo = tipo;
  set descripcion(String descripcion) => _descripcion = descripcion;
  set intereses(String intereses) => _intereses = intereses;
  set restricciones(String restricciones) => _restricciones = restricciones;
  set foto(String foto) => _foto = foto;
  set turistas(List<Turista> turistas) => _turistas = turistas;

  void setNumIntegrantes() => this._numIntegrantes = this._turistas.length;

   Map<String, dynamic> toMap(){
    return {
      'nombreGrupo': _nombreGrupo,
      'tipo': _tipo,
      'descripcion': _descripcion,
      'intereses': _intereses,
      'restricciones': _restricciones,
      'foto': _foto,
    };
  }
}
import 'package:flutter/material.dart';

class Ayuda{

  IconData _icono;
  String _nombreAyuda;
  String _quePuedeHacerse;
  String _comoPuedeHacerse;

  Ayuda(IconData icono, String nombreAyuda, String quePuedeHacerse, String comoPuedeHacerse){
    this._icono = icono;
    this._nombreAyuda = nombreAyuda;
    this._quePuedeHacerse = quePuedeHacerse;
    this._comoPuedeHacerse = comoPuedeHacerse;
  }

  IconData get icono => _icono;
  String get nombreAyuda => _nombreAyuda;
  String get quePuedeHacerse => _quePuedeHacerse;
  String get comoPuedeHacerse => _comoPuedeHacerse;

  set icono(IconData icono) => _icono = icono;
  set nombreAyuda(String nombreAyuda) => _nombreAyuda = nombreAyuda;
  set quePuedeHacerse(String quePuedeHacerse) => _quePuedeHacerse = quePuedeHacerse;
  set comoPuedeHacerse(String comoPuedeHacerse) => _comoPuedeHacerse = comoPuedeHacerse;
}
import 'package:flutter/material.dart';

class Ayuda{

  IconData _icono;
  String _nombreAyuda;
  String _descripcionAyuda;

  Ayuda(IconData icono, String nombreAyuda, String descripcionAyuda){
    this._icono = icono;
    this._nombreAyuda = nombreAyuda;
    this._descripcionAyuda = descripcionAyuda;
  }

  IconData get icono => _icono;
  String get nombreAyuda => _nombreAyuda;
  String get descripcionAyuda => _descripcionAyuda;

  set icono(IconData icono) => _icono = icono;
  set nombreAyuda(String nombreAyuda) => _nombreAyuda = nombreAyuda;
  set descripcionAyuda(String descripcionAyuda) => _descripcionAyuda = descripcionAyuda;
}
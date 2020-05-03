import 'package:flutter/material.dart';
import 'package:practica_ipo2/secciones/detallesusuario.dart';
import 'package:practica_ipo2/secciones/login.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final DatosPrueba datos = new DatosPrueba();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de circuitos',
      home: new VentanaLogin(datos: datos),
    );
  }
}


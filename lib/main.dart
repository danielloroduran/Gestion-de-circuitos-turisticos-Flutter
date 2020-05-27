import 'package:flutter/material.dart';
import 'package:practica_ipo2/secciones/login.dart';
import 'package:practica_ipo2/datos/baseDatos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  baseDatos db = baseDatos();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de circuitos',
      home: new VentanaLogin(),
    );
  }
}


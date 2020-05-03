import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';

class DetallesRuta extends StatelessWidget{

  final Ruta ruta;

  DetallesRuta({Key key, @required this.ruta}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detalles de "+ruta.nombre),
      ),
      body: Center(
        child: Text(
          ruta.nombre + " en "+ruta.localidad,
          style: TextStyle(fontSize: 24),
        )
      )
    );
  }
}
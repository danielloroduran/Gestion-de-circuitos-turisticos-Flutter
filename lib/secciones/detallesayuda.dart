import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ayuda.dart';

class DetallesAyuda extends StatelessWidget{

  final Ayuda ayuda;

  DetallesAyuda({Key key, @required this.ayuda}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Uso de "+ayuda.nombreAyuda),
      ),
      body: Center(
        child: Text(
          ayuda.descripcionAyuda,
          style: TextStyle(fontSize: 24),
        )
      )
    );
  }

}
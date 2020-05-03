import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/promocion.dart';

class DetallesPromo extends StatelessWidget{
  final Promocion promo;

  DetallesPromo({Key key, @required this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detalles de "+promo.nombrePromo),
      ),
      body: Center(
        child: Text(
          promo.mensaje,
          style: TextStyle(fontSize: 24),
        )
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/secciones/detallespuntointeres.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';

class ItemPuntoInteres extends StatelessWidget{

  PuntoInteres _puntoInteres;

  ItemPuntoInteres(this._puntoInteres);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        child: new Image(
          image: new ExactAssetImage(_puntoInteres.foto),
          fit: BoxFit.cover,
        ),
      ),
      title: new Text(_puntoInteres.nombre),
      onTap: () {
        _esperarResultado(context);
      },
    );
  }

  void _esperarResultado(BuildContext context) async{

    final puntoActualizado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesPuntoInteres(puntoInteres: _puntoInteres),
      )
    );
  }
}
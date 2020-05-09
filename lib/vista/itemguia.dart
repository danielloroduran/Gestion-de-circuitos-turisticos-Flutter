import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/secciones/detallesguia.dart';

class ItemGuia extends StatelessWidget{

  Guia _guia;

  ItemGuia(this._guia);

  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage(_guia.foto),
        backgroundColor: Colors.transparent, 
      ),
      contentPadding: EdgeInsets.all(20),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_guia.nombre,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w500),
            ),
          new Text(_guia.apellidos,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18),
            ),
        ],
      ),
      onTap: () {
        _esperarResultado(context);
      },
    );
  }

  void _esperarResultado(BuildContext context) async{

    final guiaActualizado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGuia(guia: _guia),
      )
    );

  }
}
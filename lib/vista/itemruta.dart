import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/secciones/detallesruta.dart';

class ItemRuta extends StatelessWidget{

  final Ruta _ruta;

  ItemRuta(this._ruta);

  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage(_ruta.foto),
        backgroundColor: Colors.transparent, 
      ),
      contentPadding: EdgeInsets.all(20),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_ruta.nombre,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w500),
            ),
          new Text(_ruta.localidad,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18),
            ),
        ],
      ),
      onTap: () {
        _enviarDatos(context);
      },
    );
  }

  void _enviarDatos(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesRuta(ruta: this._ruta),
      )
    );
  }

}
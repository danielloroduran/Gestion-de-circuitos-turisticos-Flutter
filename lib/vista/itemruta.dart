import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/secciones/detallesruta.dart';

class ItemRuta extends StatelessWidget{

  final Ruta _ruta;

  ItemRuta(this._ruta);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        child: new Text(_ruta.nombre[0]),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      title: new Text(_ruta.nombre),
      subtitle: new Text(_ruta.localidad),
      onTap: () {
        enviarDatos(context);
      }
    );
  }

  void enviarDatos(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesRuta(ruta: this._ruta),
      )
    );
  }

}
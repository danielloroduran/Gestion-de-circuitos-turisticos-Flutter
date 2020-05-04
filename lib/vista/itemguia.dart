import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/secciones/detallesguia.dart';

class ItemGuia extends StatelessWidget{

  Guia _guia;

  ItemGuia(this._guia);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        child: new Text(_guia.nombre[0]),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      title: new Text(_guia.nombre+" "+_guia.apellidos),
      subtitle: new Text(_guia.movil.toString()),
      onTap: () {
        _esperarResultado(context);
      }
    );
  }

  void enviarDatos(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGuia(guia: this._guia),
      )
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevoGuia = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGuia(guia: _guia),
      )
    );

  }
}
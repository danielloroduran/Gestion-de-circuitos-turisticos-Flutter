import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/secciones/detallesruta.dart';

class ItemRuta extends StatelessWidget{

  final Ruta _ruta;

  ItemRuta(this._ruta);

  @override
  Widget build(BuildContext context){
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: new ListTile(
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
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
              ),
              new Text(_ruta.localidad,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.0),
                ),
          ],
        ),
        onTap: () {
          _esperarResultado(context);
        },
      )
    );
  }

  void _esperarResultado(BuildContext context) async{
    final rutaActualizado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesRuta(ruta: this._ruta),
      )
    );
  }

}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ayuda.dart';
import 'package:practica_ipo2/secciones/detallesayuda.dart';

class ItemAyuda extends StatelessWidget{

  final Ayuda _ayuda;

  ItemAyuda(this._ayuda);

  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        radius: 25.0,
        child: new Icon(_ayuda.icono),
      ),
      contentPadding: EdgeInsets.all(20),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_ayuda.nombreAyuda,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w500),
            ),
        ],
      ),
      onTap: () {
        _enviarDatos(context);
      },
    );
  }

  void _enviarDatos(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesAyuda(ayuda: this._ayuda)));
  }
}
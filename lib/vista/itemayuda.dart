import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ayuda.dart';
import 'package:practica_ipo2/secciones/detallesayuda.dart';

class ItemAyuda extends StatelessWidget{

  final Ayuda _ayuda;

  ItemAyuda(this._ayuda);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        child: new Icon(_ayuda.icono),
      ),
      title: new Text(_ayuda.nombreAyuda),
      onTap: (){
        enviarDatos(context);
      }
    );
  }

  void enviarDatos(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesAyuda(ayuda: this._ayuda)));
  }
}
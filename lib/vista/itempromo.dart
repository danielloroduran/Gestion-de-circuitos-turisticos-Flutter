import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/secciones/detallespromo.dart';

class ItemPromo extends StatelessWidget{

  final Promocion _promo;

  ItemPromo(this._promo);
/*
  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        child: new Text(_promo.nombrePromo[0]),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      title: new Text(_promo.nombrePromo),
      onTap: () {
        enviarDatos(context);
      },
    );
  }
*/

@override
Widget build(BuildContext context){

  return ListTile(
    contentPadding: EdgeInsets.all(10),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(_promo.nombrePromo, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500)),
        new Text(_promo.mensaje, style: TextStyle(color: Colors.grey[500], fontSize: 20)),
      ],
    ),
    trailing: Column(
      children: <Widget>[
        new Text(_promo.precio.toString()+"€", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500)),
        Container(
          width: 75,
          height: 25,
          child: new Text("-25%", style: TextStyle(color: Colors.black)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          )
        )
      ],
    ),
    onTap: () {
      enviarDatos(context);
    },
  );

}
  void enviarDatos(BuildContext context){
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => DetallesPromo(promo: this._promo),)
    );
  }
}
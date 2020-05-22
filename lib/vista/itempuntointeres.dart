import 'package:flutter/material.dart';
import 'package:practica_ipo2/secciones/detallespuntointeres.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';

class ItemPuntoInteres extends StatelessWidget{

  PuntoInteres _puntoInteres;

  ItemPuntoInteres(this._puntoInteres);

  @override
  Widget build(BuildContext context){
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: new ListTile(
        leading: new CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(_puntoInteres.foto),
          backgroundColor: Colors.transparent,
        ),
        contentPadding: EdgeInsets.all(20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_puntoInteres.nombre,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
              ),
            new Text("Horario: "+_puntoInteres.horario,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ))
          ],
        ),
        onTap: () {
          _esperarResultado(context);
        },
      )
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
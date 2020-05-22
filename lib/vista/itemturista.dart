import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/secciones/detallesturista.dart';

class ItemTurista extends StatelessWidget{

  final Turista _turista;

  ItemTurista(this._turista);

  @override
  Widget build(BuildContext context){
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: new ListTile(
        leading: new CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(_turista.foto),
          backgroundColor: Colors.transparent,
        ),
        contentPadding: EdgeInsets.all(20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_turista.nombre + " " + _turista.apellidos,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
              ),
            new Row(
              children: <Widget>[
                new Icon(Icons.phone, color: Colors.grey[500]),
                new Text(" "+_turista.movil.toString(), 
                  style: TextStyle(
                      color: Colors.grey[500], 
                      fontSize: 16.0
                    ),
                )
              ],
            )
          ],
        ),
        onTap: () {
          _enviarDatos(context);
        },
      )
    );
  }

  void _enviarDatos(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesTurista(turista: this._turista)
      )
    );
  }
}
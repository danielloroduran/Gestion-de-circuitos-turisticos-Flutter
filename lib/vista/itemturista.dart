import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/secciones/detallesturista.dart';

class ItemTurista extends StatefulWidget{

  DatosPrueba datos;
  Turista turista;
  GrupoTurista grupo;

  ItemTurista({Key key, this.datos, this.turista, this.grupo}) : super(key: key);

  _ItemTuristaState createState() => _ItemTuristaState(datos, turista, grupo);

}


class _ItemTuristaState extends State<ItemTurista> with SingleTickerProviderStateMixin{

  DatosPrueba _datos;
  Turista _turista;
  GrupoTurista _grupo;

  _ItemTuristaState(this._datos, this._turista, this._grupo);

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
          _esperarResultado(context);
        },
      )
    );
  }

  void _esperarResultado(BuildContext context) async{
    
    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesTurista(datos: _datos, turista: _turista, grupo: _grupo),
      )
    );

    setState(() {
      if(nuevosDatos != null){
        _datos = nuevosDatos;
      }
    });
  }
}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/secciones/detallesguia.dart';

class ItemGuia extends StatefulWidget{

  DatosPrueba datos;
  Guia guia;

  ItemGuia({Key key, this.datos, this.guia}) : super(key: key);

  _ItemGuiaState createState() => _ItemGuiaState(datos, guia);

}


class _ItemGuiaState extends State<ItemGuia> with SingleTickerProviderStateMixin{

  DatosPrueba _datos;
  Guia _guia;

  _ItemGuiaState(this._datos,this._guia);
  
  @override
  Widget build(BuildContext context){
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: new ListTile(
        leading: new CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(_guia.foto),
          backgroundColor: Colors.transparent,
        ),
        contentPadding: EdgeInsets.all(20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_guia.nombre +" "+ _guia.apellidos,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
              ),
              new Row(
                children: <Widget>[
                  new Icon(Icons.phone, color: Colors.grey[500]),
                  new Text(" "+_guia.movil.toString(),
                    style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.0),
                  ),
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
        builder: (context) => DetallesGuia(datos: _datos, guia: _guia),
      )
    );

    setState(() {
      _datos = nuevosDatos;
    });

  }
}
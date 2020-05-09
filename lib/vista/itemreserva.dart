import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/secciones/detallesreserva.dart';

class ItemReserva extends StatelessWidget{

  final Ruta _ruta;

  ItemReserva(this._ruta);

  @override
  Widget build(BuildContext context){
    return ListTile(
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
              fontSize: 22.0,
              fontWeight: FontWeight.w500),
            ),
          new Text(_ruta.localidad,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18),
            ),
        ],
      ),
      trailing: new Text(_ruta.estado, style: TextStyle(color: Colors.black, fontSize: 22)),
      onTap: () {
        _enviarDatos(context);
      },
    );
  }

  void _enviarDatos(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesReserva(ruta: this._ruta),
      )
    );
  }

}
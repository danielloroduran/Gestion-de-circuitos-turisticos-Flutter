import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/secciones/detallesreserva.dart';

class ItemReserva extends StatelessWidget{

  final Ruta _ruta;

  ItemReserva(this._ruta);

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
                fontWeight: FontWeight.w500
              )),
              new Text(_ruta.localidad,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16.0,
              )),
              _crearEstrellas(),
            ],
          ),
          trailing: _crearTexto(),
          onTap: () {
            _enviarDatos(context);
          },
        )
      );
  }

    Text _crearEstrellas() {
    String estrellas = '';

    for (int i = 0; i < _ruta.puntuacion; i++) {
      estrellas += '⭐ ';
    }
    estrellas.trim();
    return Text(estrellas);
  }

    Widget _crearTexto(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_ruta.estado, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18)),
          SizedBox(height: 5),
          new Text(_ruta.fecha, style: TextStyle(color: Colors.black, fontSize: 16))
        ],
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
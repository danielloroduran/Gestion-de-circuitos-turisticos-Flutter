import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/secciones/detallespromo.dart';

class ItemPromo extends StatelessWidget {
  final Promocion _promo;

  ItemPromo(this._promo);

  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: new ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                _promo.nombrePromo,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              new Text(
                _promo.mensaje,
                style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
              )
            ],
          ),
          trailing: Column(
            children: <Widget>[
              new Text(_promo.precio.toString() + "€",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough)),
              new Text(_promo.precioFinal.toString() + "€",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          onTap: () {
            _enviarDatos(context);
          },
        ));
  }

/*
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_promo.nombrePromo,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          new Text(_promo.mensaje,
              style: TextStyle(color: Colors.grey[500], fontSize: 18)),
        ],
      ),
      trailing: Column(
        children: <Widget>[
          new Text(_promo.precio.toString() + "€",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough)),
          new Text(_promo.precioFinal.toString() + "€",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
        ],
      ),
      onTap: () {
        _enviarDatos(context);
      },
    );
  }*/

  void _enviarDatos(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetallesPromo(promo: this._promo),
        ));
  }
}

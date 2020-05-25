import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/secciones/detallespromo.dart';

class ItemPromo extends StatefulWidget{

  DatosPrueba datos;
  Promocion promo;

  ItemPromo({Key key, this.datos, this.promo}) : super(key: key);

  _ItemPromoState createState() => _ItemPromoState(datos, promo);

}



class _ItemPromoState extends State<ItemPromo> with SingleTickerProviderStateMixin {

  DatosPrueba _datos;
  Promocion _promo;

  _ItemPromoState(this._datos, this._promo);

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
            _esperarResultado(context);
          },
        ));
  }

  void _esperarResultado(BuildContext context) async{

    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesPromo(datos: _datos, promo: _promo),
      )
    );

    setState(() {
      if(nuevosDatos != null){
        _datos = nuevosDatos;
      }
    });

  }
}

import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/vista/itempromo.dart';

class ListadoPromo extends StatelessWidget{
  final DatosPrueba datos;

  ListadoPromo({@required this.datos});

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: ConstruirPromo(datos: datos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            
        },
        child: new Icon(Icons.add),
      ),
    );
  }

}

class ConstruirPromo extends StatelessWidget{

  final DatosPrueba datos;
  ConstruirPromo({@required this.datos});

  List<Promocion> _construirPromos(){
    return datos.promociones;
  }

  List<ItemPromo> _construirLista(){
    return _construirPromos().map(
      (promo) => new ItemPromo(promo)
    ).toList();
  }
/*  @override
  Widget build(BuildContext context){
    return new ListView(
      children: _construirLista(),
    );
  }*/

  @override
  Widget build(BuildContext context){
    return Stack(children: <Widget>[
      new Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SafeArea(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _construirLista(),
          )
        )
      )
    ],);
  }
}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/vista/itemruta.dart';



class ListadoRutas extends StatelessWidget{

  final DatosPrueba datos;
  ListadoRutas({@required this.datos});

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: ConstruirRuta(datos: datos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: new Icon(Icons.add),
      ),
    );
  }

}

class ConstruirRuta extends StatelessWidget{

  final DatosPrueba datos;
  ConstruirRuta({@required this.datos});

  List<Ruta> _construirRutas(){
    return datos.rutas;
  }

  List<ItemRuta> _construirLista(){
    return _construirRutas().map(
      (ruta) => new ItemRuta(ruta)
    ).toList();
  }

  Widget build(BuildContext context){
    return new ListView(
      children: _construirLista(),
    );
  }
}
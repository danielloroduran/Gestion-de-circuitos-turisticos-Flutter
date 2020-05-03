import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/vista/itemguia.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/detallesguia.dart';

class ListadoGuias extends StatelessWidget{

  final DatosPrueba datos;
  ListadoGuias({@required this.datos});

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: ConstruirGuias(datos: datos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute( builder: (context) => DetallesGuia(datos: datos),
            )
          );
        },
        child: new Icon(Icons.add),
      ),
    );
  }

}

class ConstruirGuias extends StatelessWidget{

  final DatosPrueba datos;
  ConstruirGuias({@required this.datos});

  List<Guia> _construirGuias(){

    return datos.guias;
  }

  List<ItemGuia> _construirLista(){
    return _construirGuias().map(
      (guia) => new ItemGuia(guia)
    ).toList();
  }

  Widget build(BuildContext context){
    return new ListView(
      children: _construirLista(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ayuda.dart';
import 'package:practica_ipo2/vista/itemayuda.dart';

class ListadoAyuda extends StatelessWidget {

  static const nombreRuta = "/ayuda";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ayuda"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ConstruirAyudas(),
    );
  }
}

class ConstruirAyudas extends StatelessWidget{

  List<Ayuda> _construirAyuda(){

    return <Ayuda>[
      Ayuda(Icons.home, "Pestaña de Rutas", "Aquí aparecería la ayuda de la pestaña de Rutas"),
      Ayuda(Icons.people, "Pestaña de turistas", "Aquí aparecería la ayuda de los turistas"),
      Ayuda(Icons.message,"Pestaña de promociones", "Aquí aparecería la ayuda de la pestaña de promociones"),
      Ayuda(Icons.person, "Pestaña de guías", "Aquí aparecería la ayuda de la pestaña de guías"),
      Ayuda(Icons.people, "Pestaña de grupos", "Aquí aparecería la ayuda de la pestaña de grupos"),
    ];
  }

  List<ItemAyuda> _construirLista(){
    return _construirAyuda().map(
      (ayuda) => new ItemAyuda(ayuda)
    ).toList();
  }

  Widget build(BuildContext context){
    return new ListView(
      children: _construirLista(),
    );
  }

}

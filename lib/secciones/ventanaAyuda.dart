import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/vista/itemayuda.dart';

class VentanaAyuda extends StatefulWidget{

  DatosPrueba datos;

  VentanaAyuda({Key key, @required this.datos}) : super(key: key);

  @override
  _VentanaAyudaState createState() => _VentanaAyudaState(datos: datos);

}

class _VentanaAyudaState extends State<VentanaAyuda> with SingleTickerProviderStateMixin{

  DatosPrueba datos;

  _VentanaAyudaState({@required this.datos});

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ayuda"),
      ),
      body: _construirLista(),
    );
  }

  Widget _construirLista(){
    return ListView.builder(
      itemCount: datos.ayuda.length,
      itemBuilder: (context, int index){
        return new Container(
          child: ItemAyuda(datos.ayuda[index]),
        );
      }
    );
  }

}


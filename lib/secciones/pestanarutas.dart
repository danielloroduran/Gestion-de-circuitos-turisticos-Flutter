import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/vista/itemruta.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';



class ReservaRutas extends StatefulWidget{
  final DatosPrueba datos;
  ReservaRutas({Key key, @required this.datos}) : super(key: key);
  @override
  _ReservaRutasState createState() => _ReservaRutasState(datos: datos);
}

class _ReservaRutasState extends State<ReservaRutas> with SingleTickerProviderStateMixin{
  final DatosPrueba datos;
  _ReservaRutasState({@required this.datos});

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
      body: ConstruirReservaRutas(datos: datos)
    );
  }
}

class ConstruirReservaRutas extends StatelessWidget{
  final DatosPrueba datos;
  ConstruirReservaRutas({@required this.datos});
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


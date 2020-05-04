import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/vista/itemturista.dart';
import 'package:practica_ipo2/secciones/detallesturista.dart';

class ListadoTuristas extends StatefulWidget{

  DatosPrueba datos;
  List<Turista> turistas;

  ListadoTuristas({Key key, this.datos, this.turistas}) : super(key: key);

  @override
  _ConstruirTuristasState createState() => _ConstruirTuristasState(datos: datos, turistas: turistas);


}

class _ConstruirTuristasState extends State<ListadoTuristas> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  List<Turista> turistas;

  _ConstruirTuristasState({this.datos, this.turistas});
  Widget listaTuristas;

  void initState(){
    super.initState();

    if(turistas.length > 0){
      listaTuristas = _construirLista();
    }else{
      listaTuristas = null;
    }

  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Integrantes"),
        backgroundColor: Colors.blueAccent,
      ),
      body: listaTuristas,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _esperarResultado(context);
        },
        child: new Icon(Icons.add),
      )
    );
  }
  
  Widget _construirLista(){
    return ListView.builder(
      itemCount: turistas.length,
      itemBuilder: (context, int index){
        return new Container(
          child: ItemTurista(turistas[index])
        );
      }
    );
  }

  void _esperarResultado(BuildContext context) async{

    final turista = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesTurista(),
      )
    );

    setState((){

      if(turista!= null){
        turistas.add(turista);
        datos.turistasGeneral.add(turista);
      }
    });

  }

}

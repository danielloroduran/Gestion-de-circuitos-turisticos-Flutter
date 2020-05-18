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
        final item = turistas[index];

        return Dismissible(
          key: Key(item.nombre),

          onDismissed: (direction){
            setState(() {
              turistas.removeAt(index);
              datos.turistasGeneral.remove(item);
            });

            Scaffold.of(context).showSnackBar(SnackBar(content: Text(item.nombre + " eliminado")));
          },
          background: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20.0),
            color: Colors.redAccent,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          secondaryBackground: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
            color: Colors.redAccent,
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: ItemTurista(turistas[index]),
          );
      },
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevoturista = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesTurista(),
      )
    );

    setState((){

      if(nuevoturista!= null){
        turistas.add(nuevoturista);
        datos.turistasGeneral.add(nuevoturista);
      }
    });

  }

}

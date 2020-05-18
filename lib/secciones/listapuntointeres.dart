import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';
import 'package:practica_ipo2/vista/itempuntointeres.dart';
import 'package:practica_ipo2/secciones/detallespuntointeres.dart';

class ListadoPuntoInteres extends StatefulWidget{

  DatosPrueba datos;
  List<PuntoInteres> puntoInteres;

  ListadoPuntoInteres({Key key, this.datos, this.puntoInteres}) : super(key: key);

  @override
  _ConstruirPuntoInteresState createState() => _ConstruirPuntoInteresState(datos: datos, puntoInteres: puntoInteres);
}

class _ConstruirPuntoInteresState extends State<ListadoPuntoInteres> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  List<PuntoInteres> puntoInteres;

  _ConstruirPuntoInteresState({this.datos, this.puntoInteres});
  Widget listapuntoInteres;

  void initState(){
    super.initState();

    if(puntoInteres.length >  0){
      listapuntoInteres = _construirLista();
    }else{
      listapuntoInteres = null;
    }
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Puntos de interés"),
        backgroundColor: Colors.blueAccent,
      ),
      body: listapuntoInteres,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _esperarResultado(context);
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget _construirLista(){
    return ListView.builder(
      itemCount: puntoInteres.length,
      itemBuilder: (context, int index){
        final item = puntoInteres[index];

        return Dismissible(
          key: Key(item.nombre),

          onDismissed: (direction){
            setState(() {
              puntoInteres.removeAt(index);
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
          child: ItemPuntoInteres(puntoInteres[index]),
          );
      },
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevopuntoInteres = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesPuntoInteres(),
      )
    );

    setState(() {
      if(nuevopuntoInteres != null){
        puntoInteres.add(nuevopuntoInteres);
        datos.puntoInteres.add(nuevopuntoInteres);
      }
    });
  }
}
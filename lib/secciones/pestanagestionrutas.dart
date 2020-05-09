import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/vista/itemruta.dart';
import 'package:practica_ipo2/secciones/detallesruta.dart';

class ListadoRutas extends StatefulWidget{

  DatosPrueba datos;

  ListadoRutas({Key key, @required this.datos}) : super(key: key);

  @override
  _ListadoRutasState createState() => _ListadoRutasState(datos: datos);
}

class _ListadoRutasState extends State<ListadoRutas> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  _ListadoRutasState({@required this.datos});

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
      body: _construirLista(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _esperarResultado(context);
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget _construirLista() {
    return ListView.builder(
      itemCount: datos.guias.length,
      itemBuilder: (context, int index){
        return new Container(
          child: ItemRuta(datos.rutas[index])
        );
      }
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesRuta(datos: datos),
      )
    );

    setState((){
      if(nuevosDatos != null){
        datos = nuevosDatos;
      }
    });
  }

}

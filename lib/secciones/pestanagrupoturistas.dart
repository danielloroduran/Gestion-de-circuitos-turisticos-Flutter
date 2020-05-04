import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/detallesgrupoturista.dart';
import 'package:practica_ipo2/vista/itemgrupo.dart';

class ListadoGrupoTuristas extends StatefulWidget{

  DatosPrueba datos;

  ListadoGrupoTuristas({Key key, @required this.datos}) : super(key: key);

  @override
  _ListadoGrupoTuristasState createState() => _ListadoGrupoTuristasState(datos: datos);
  
}

class _ListadoGrupoTuristasState extends State<ListadoGrupoTuristas> with SingleTickerProviderStateMixin{

  DatosPrueba datos;

  _ListadoGrupoTuristasState({@required this.datos});

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

  Widget _construirLista(){
    return ListView.builder(
      itemCount: datos.grupoTurista.length,
      itemBuilder: (context, int index){
        return new Container(
          child: ItemGrupo(datos.grupoTurista[index])
        );
      }
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGrupo(datos: datos),
      )
    );

    setState((){
      if(nuevosDatos != null){
        datos = nuevosDatos;
      }
    });

  }

}




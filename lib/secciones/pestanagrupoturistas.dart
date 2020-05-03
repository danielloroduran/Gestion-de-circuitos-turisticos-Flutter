import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/vista/itemgrupo.dart';

class ListadoGrupoTuristas extends StatelessWidget{

  DatosPrueba datos;
  ListadoGrupoTuristas({@required this.datos});

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: ConstruirGruposTuristas(datos: datos),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: new Icon(Icons.add),
      ),
    );
  }

}

class ConstruirGruposTuristas extends StatelessWidget{

  DatosPrueba datos;
  ConstruirGruposTuristas({@required this.datos});

  List<GrupoTurista> _construirGrupoTuristas(){

    return datos.grupoTurista;
  }

  List<ItemGrupo> _construirLista(){
    return _construirGrupoTuristas().map(
      (grupoTurista) => new ItemGrupo(grupoTurista)
    ).toList();
  }

  Widget build(BuildContext context){
    return new ListView(
      children: _construirLista(),
    );
  }
}




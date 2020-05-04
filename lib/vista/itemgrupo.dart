import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/secciones/detallesgrupoturista.dart';


class ItemGrupo extends StatelessWidget{

  final GrupoTurista _grupoTurista;

  ItemGrupo(this._grupoTurista);

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        child: new Text(_grupoTurista.nombreGrupo[0]),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
      ),
      title: new Text(_grupoTurista.nombreGrupo),
      subtitle: new Text(_grupoTurista.numIntegrantes.toString() + " integrantes"),
      onTap: () {
        enviarDatos(context);
      }
    );
  }

    void enviarDatos(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGrupo(grupo: this._grupoTurista),
      )
    );
  }

}
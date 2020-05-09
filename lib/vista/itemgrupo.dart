import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/secciones/detallesgrupoturista.dart';


class ItemGrupo extends StatelessWidget{

  final GrupoTurista _grupoTurista;

  ItemGrupo(this._grupoTurista);

  Widget build(BuildContext context){
    return ListTile(
      leading: new CircleAvatar(
        radius: 25.0,
        child: new Text(_grupoTurista.nombreGrupo[0], style: TextStyle(color: Colors.white)),
      ),
      contentPadding: EdgeInsets.all(20),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_grupoTurista.nombreGrupo,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w500),
            ),
          new Text(_grupoTurista.numIntegrantes.toString() + " integrantes",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18),
            ),
        ],
      ),
      onTap: () {
        _enviarDatos(context);
      },
    );
  }

    void _enviarDatos(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGrupo(grupo: this._grupoTurista),
      )
    );
  }

}
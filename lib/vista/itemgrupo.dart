import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/secciones/detallesgrupoturista.dart';

class ItemGrupo extends StatefulWidget{

  DatosPrueba datos;
  GrupoTurista grupo;

  ItemGrupo({Key key, this.datos, this.grupo}) : super(key: key);

  _ItemGrupoState createState() => _ItemGrupoState(datos, grupo);
}

class _ItemGrupoState extends State<ItemGrupo> with SingleTickerProviderStateMixin{

  DatosPrueba _datos;
  GrupoTurista _grupoTurista;

  _ItemGrupoState(this._datos, this._grupoTurista);

  @override
  Widget build(BuildContext context){
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: new ListTile(
        leading: new CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(_grupoTurista.foto),
        ),
        contentPadding: EdgeInsets.all(20),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_grupoTurista.nombreGrupo,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
              ),
              new Text(_grupoTurista.numIntegrantes.toString() + " integrantes",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.0),
                ),
          ],
        ),
        onTap: () {
          _esperarResultado(context);
        },
      )
    );
  }

    void _esperarResultado(BuildContext context) async{
      
    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGrupo(datos: _datos, grupo: _grupoTurista),
      )
    );

    setState(() {
      if(nuevosDatos != null){
        _datos = nuevosDatos;
      }
    });
  }

}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/baseDatos.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
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
  BaseDatos bd;
  _ListadoGrupoTuristasState({@required this.datos});

  @override
  void initState(){
    super.initState();
    bd = new BaseDatos();
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
      child: new Icon(Icons.group_add),
      ),
    );
  }

  Widget _construirLista(){
    return ListView.builder(
      itemCount: datos.grupoTurista.length,
      itemBuilder: (context, int index){
        final item = datos.grupoTurista[index];

        return Dismissible(
          key: Key(item.nombreGrupo),

          onDismissed: (direction){
            setState(() {
              eliminarBBDD(bd, item.nombreGrupo);
              datos.grupoTurista.removeAt(index);
            });

            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(item.nombreGrupo + " y sus integrantes eliminados"),
                action: SnackBarAction(
                  label: "Deshacer",
                  onPressed: () {
                    setState(() {
                      datos.grupoTurista.insert(index, item);
                      insertarBBDD(bd, item);
                    });
                  },
                ),
              )
            );
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
          child: ItemGrupo(datos: datos, grupo: datos.grupoTurista[index]),
          );
      },
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
  void insertarBBDD(BaseDatos db, GrupoTurista grupo) async{
    await db.initdb();
    db.insertGrupoTuristas(grupo);
  }
  void modificarBBDD(BaseDatos db, String nombreGrupoViejo, GrupoTurista grupo) async{
    await db.initdb();
    db.updateGruposTuristas(nombreGrupoViejo, grupo);
  }
  void eliminarBBDD(BaseDatos db, String grupo) async{
    await db.initdb();
    db.deleteGrupoTuristas(grupo);
  }
}




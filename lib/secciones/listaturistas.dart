import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/vista/itemturista.dart';
import 'package:practica_ipo2/secciones/detallesturista.dart';
import 'package:practica_ipo2/datos/baseDatos.dart';

class ListadoTuristas extends StatefulWidget{

  DatosPrueba datos;
  GrupoTurista grupo;

  ListadoTuristas({Key key, this.datos, this.grupo}) : super(key: key);

  @override
  _ListadoTuristasState createState() => _ListadoTuristasState(datos: datos, grupo: grupo);


}

class _ListadoTuristasState extends State<ListadoTuristas> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  GrupoTurista grupo;
  BaseDatos bd;
  _ListadoTuristasState({this.datos, this.grupo});
  Widget listaTuristas;

  void initState(){
    super.initState();
    bd  = new BaseDatos();
    if(grupo == null){
      grupo = new GrupoTurista.enBlanco();
    }

  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Integrantes"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: grupo.turistas.length,
        itemBuilder: (context, int index){
          final item = grupo.turistas[index];

          return Dismissible(
            key: Key(item.nombre),
            onDismissed: (direction) {
              setState(() {
                eliminarBBDDGrupos(bd, datos.turistasGeneral.elementAt(item).dni, grupo.nombreGrupo);
                eliminarBBDD(bd, datos.turistasGeneral.elementAt(item).dni);
                grupo.turistas.removeAt(index);
                datos.turistasGeneral.removeAt(item);
              });

              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(item.nombre + " eliminado del grupo y sistema"),
                  action: SnackBarAction(
                    label: "Deshacer",
                    onPressed: () {
                      setState(() {
                        insertarBBDDGrupos(bd, grupo, item);
                        insertarBBDD(bd, item);
                        grupo.turistas.insert(index, item);
                        datos.turistasGeneral.add(item);
                      });
                    },
                  )
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
            child: ItemTurista(datos: datos, turista: grupo.turistas[index], grupo: grupo),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _esperarResultado(context);
        },
        child: new Icon(Icons.person_add),
        tooltip: "Añadir nuevo turista",
      )
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesTurista(),
      )
    );

    setState((){

      if(nuevosDatos!= null){
        datos = nuevosDatos;
      }
    });

  }
  void insertarBBDD(BaseDatos db, Turista turista) async{
    await db.initdb();
    db.insertTuristas(turista);
  }

  void eliminarBBDD(BaseDatos db, String dni) async{
    await db.initdb();
    db.deleteTuristas(dni);
  }
  void insertarBBDDGrupos(BaseDatos db, GrupoTurista gp,Turista turista) async{
    await db.initdb();
    db.insertGTTuristas(gp.nombreGrupo, turista.dni);
  }
  void eliminarBBDDGrupos(BaseDatos db, String dni, String grupo) async{
    await db.initdb();
    db.deleteGTTuristas(dni, grupo);
  }
}

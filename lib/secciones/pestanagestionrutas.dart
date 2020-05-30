import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/vista/itemruta.dart';
import 'package:practica_ipo2/secciones/detallesruta.dart';
import 'package:practica_ipo2/datos/baseDatos.dart';

class ListadoRutas extends StatefulWidget{

  DatosPrueba datos;

  ListadoRutas({Key key, @required this.datos}) : super(key: key);

  @override
  _ListadoRutasState createState() => _ListadoRutasState(datos: datos);
}

class _ListadoRutasState extends State<ListadoRutas> with SingleTickerProviderStateMixin{
  BaseDatos bd;
  DatosPrueba datos;
  _ListadoRutasState({@required this.datos});

  @override
  void initState(){
    super.initState();
    bd = BaseDatos();
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
      itemCount: datos.rutas.length,
      itemBuilder: (context, int index){
        final item = datos.rutas[index];

        return Dismissible(
          key: Key(item.nombre),

          onDismissed: (direction){
            setState(() {
              datos.rutas.removeAt(index);
              eliminarBBDD(bd, item.nombre);
            });

            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(item.nombre + " eliminada"),
                action: SnackBarAction(
                  label: "Deshacer",
                  onPressed: () {
                    setState(() {
                      datos.rutas.insert(index, item);
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
          child: ItemRuta(datos: datos, ruta: datos.rutas[index]),
          );
      },
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
  void insertarBBDD(BaseDatos db, Ruta ruta) async{
    await db.initdb();
    db.insertRutas(ruta);
  }
  void modificarBBDD(BaseDatos db, String nombreRuta, Ruta ruta) async{
    await db.initdb();
    db.updateRutas(nombreRuta, ruta);
  }
  void eliminarBBDD(BaseDatos db, String ruta) async{
    await db.initdb();
    db.deleteRutas(ruta);
  }
}

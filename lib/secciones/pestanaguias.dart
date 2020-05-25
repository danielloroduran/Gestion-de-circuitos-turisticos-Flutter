import 'package:flutter/material.dart';
import 'package:practica_ipo2/vista/itemguia.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/detallesguia.dart';

class ListadoGuias extends StatefulWidget{

  DatosPrueba datos;
  
  ListadoGuias({Key key, @required this.datos}) : super(key: key);

  @override
  _ListadoGuiasState createState() => _ListadoGuiasState(datos: datos);

}

class _ListadoGuiasState extends State<ListadoGuias> with SingleTickerProviderStateMixin{

  DatosPrueba datos;

  _ListadoGuiasState({@required this.datos});

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
      child: new Icon(Icons.person_add),
      ),
    );
  }

  Widget _construirLista(){
    return ListView.builder(
      itemCount: datos.guias.length,
      itemBuilder: (context, int index){
        final item = datos.guias[index];

        return Dismissible(
          key: Key(item.nombre),

          onDismissed: (direction){
            setState(() {
              datos.guias.removeAt(index);
            });

            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(item.nombre + " eliminado"),
                action: SnackBarAction(
                  label: "Deshacer",
                  onPressed: () {
                    setState(() {
                      datos.guias.insert(index, item);
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
          child: ItemGuia(datos: datos, guia: datos.guias[index]),
          );
      },
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesGuia(datos: datos),
      )
    );

    setState((){
      if(nuevosDatos != null){
        datos = nuevosDatos;
      }
    });

  }


}


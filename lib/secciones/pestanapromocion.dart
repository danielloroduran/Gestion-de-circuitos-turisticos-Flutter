import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/secciones/detallespromo.dart';
import 'package:practica_ipo2/vista/itempromo.dart';


class ListadoPromo extends StatefulWidget{

  DatosPrueba datos;

  ListadoPromo({Key key, @required this.datos}) : super(key: key);

  @override
  _ListadoPromoState createState() => _ListadoPromoState(datos: datos);
}


class _ListadoPromoState extends State<ListadoPromo> with SingleTickerProviderStateMixin{
  
  DatosPrueba datos;

  _ListadoPromoState({@required this.datos});

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
      itemCount: datos.promociones.length,
      itemBuilder: (context, int index){
        final item = datos.promociones[index];

        return Dismissible(
          key: Key(item.nombrePromo),

          onDismissed: (direction){
            setState(() {
              datos.promociones.removeAt(index);
            });

            Scaffold.of(context).showSnackBar(SnackBar(content: Text(item.nombrePromo + " eliminada")));
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
          child: ItemPromo(datos, datos.promociones[index]),
          );
      },
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesPromo(datos: datos),
      )
    );
  setState((){
      if(nuevosDatos != null){
        datos = nuevosDatos;
      }
    });

  }

}

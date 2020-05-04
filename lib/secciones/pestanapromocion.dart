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
//            _esperarResultado(context);
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget _construirLista(){
    return Stack(children: <Widget>[
      new Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: ListView.builder(
          itemCount: datos.promociones.length,
          itemBuilder: (context, int index){
            return new Container(
              child: ItemPromo(datos.promociones[index])
            );
          }
        )
      )
    ],);
  }

/*  void _esperarResultado(BuildContext context) async{

    final nuevosDatos = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesPromo(datos: datos),
      )
    )
  }*/

}

import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/turista.dart';

class ListadoTuristasPromo extends StatefulWidget{

  DatosPrueba datos;

  ListadoTuristasPromo({Key key, this.datos}) : super(key: key);

  @override
  _ListadoTuristasState createState() => _ListadoTuristasState(datos: datos);


}

class _ListadoTuristasState extends State<ListadoTuristasPromo> with SingleTickerProviderStateMixin{

  DatosPrueba datos;

  _ListadoTuristasState({this.datos});
  

  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Text ("Turistas"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Seleccionar todos", style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  for(int i = 0; i < datos.turistasGeneral.length; i++){
                    datos.turistasGeneral[i].seleccionado = true;
                  }
                });
              },
            )
          ],
        ),
        body: ListView (
          children: List.generate (datos.turistasGeneral.length, (index) {
            return new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: new ListTile (
              onTap: () {
                setState (() {
                  datos.turistasGeneral[index].seleccionado =! datos.turistasGeneral[index].seleccionado;
                });
              },
              selected: datos.turistasGeneral[index].seleccionado,
              leading: GestureDetector (
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container (
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric (vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(datos.turistasGeneral[index].foto),
                    radius: 25.0,
                  )
                ),
              ),
              title: Text (datos.turistasGeneral[index].nombre + " " + datos.turistasGeneral[index].apellidos, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
              trailing: (datos.turistasGeneral[index].seleccionado)
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
              contentPadding: EdgeInsets.all(13),  
            )
            );

          }),
          
        ),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: () {
            _mostrarDialogo();
          },
          tooltip: "Enviar promoción",
        )
    );
  }

    void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("¡Enviado!"),
          content: new Text("La promoción se ha enviado correctamente a los turistas seleccionados"),
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Aceptar"),
                  onPressed: (){
                    setState(() {
                      for(int i = 0; i < datos.turistasGeneral.length; i++){
                        if(datos.turistasGeneral[i].seleccionado){
                          datos.turistasGeneral[i].seleccionado = false;
                        }
                      }
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                )
              ],
            )
          ],
        );
      }
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/turista.dart';

class ListadoTuristasPromo extends StatefulWidget{

  DatosPrueba datos;
  List<Turista> turistas;

  ListadoTuristasPromo({Key key, this.datos, this.turistas}) : super(key: key);

  @override
  _ConstruirTuristasState createState() => _ConstruirTuristasState(datos: datos, turistas: turistas);


}

class _ConstruirTuristasState extends State<ListadoTuristasPromo> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  List<Turista> turistas;

  _ConstruirTuristasState({this.datos, this.turistas});
  Widget listaTuristas;

  void initState(){
    super.initState();

    if(turistas == null){
      turistas = new List<Turista>();
    }

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
                  for(int i = 0; i < turistas.length; i++){
                    turistas[i].seleccionado = true;
                  }
                });
              },
            )
          ],
        ),
        body: ListView (
          children: List.generate (turistas.length, (index) {
            return ListTile (
              onTap: () {
                setState (() {
                  turistas[index].seleccionado =! turistas[index].seleccionado;
                });
              },
              selected: turistas[index].seleccionado,
              leading: GestureDetector (
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container (
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric (vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(turistas[index].foto),
                  )
                ),
              ),
              title: Text (turistas[index].nombre + " " + turistas[index].apellidos, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
              trailing: (turistas[index].seleccionado)
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
                  
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
                      for(int i = 0; i < turistas.length; i++){
                        if(turistas[i].seleccionado){
                          turistas[i].seleccionado = false;
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
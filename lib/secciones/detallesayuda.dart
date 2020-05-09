import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ayuda.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';

class DetallesAyuda extends StatefulWidget{

  DatosPrueba datos;
  Ayuda ayuda;

  DetallesAyuda({Key key, this.datos, this.ayuda}) : super(key: key);

  @override
  _DetallesAyudaState createState() => _DetallesAyudaState(datos: datos, ayuda: ayuda);

}

class _DetallesAyudaState extends State<DetallesAyuda> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  Ayuda ayuda;

  _DetallesAyudaState({this.datos, this.ayuda});

  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ayuda en "+ayuda.nombreAyuda),
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Text("¿Qué se hace aquí?",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ) 
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(ayuda.quePuedeHacerse,
                                style: TextStyle(
                                  fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Text("¿Cómo se utiliza esta sección?",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ) 
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new Text(ayuda.comoPuedeHacerse,
                                style: TextStyle(
                                  fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ],
            )
          ],
        )
      )
    );
  }

}
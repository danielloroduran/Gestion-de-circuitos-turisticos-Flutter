import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/vista/itemturista.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';

class DetallesGrupo extends StatefulWidget{

  DatosPrueba datos;
  GrupoTurista grupo;

  DetallesGrupo({Key key, this.datos, this.grupo}) : super(key: key);

  @override
  _DetallesGrupoState createState() => _DetallesGrupoState(datos: datos, grupo: grupo);

}

class _DetallesGrupoState extends State<DetallesGrupo> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  GrupoTurista grupo;

  _DetallesGrupoState({this.datos, this.grupo});
  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController descripcionController;
  TextEditingController interesesController;
  TextEditingController restriccionesController;

  void initState(){
    super.initState();

    nombreController = new TextEditingController();
    descripcionController = new TextEditingController();
    interesesController = new TextEditingController();
    restriccionesController = new TextEditingController();

    if(grupo != null){
      nombreController.text = grupo.nombreGrupo;
      descripcionController.text = grupo.descripcion;
      interesesController.text = grupo.intereses;
      restriccionesController.text = grupo.restricciones;
    }else{
      nombreController.text = "";
      descripcionController.text = "";
      interesesController.text = "";
      restriccionesController.text = "";
      _editable = true;
    }
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Grupo"),
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
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text("Información de grupo",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500
                                        )
                                      ),
                                    ],
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: getEditIcon()
                                      )
                                    ],
                                  )
                                ]
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text("Nombre de grupo",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500
                                        ),
                                      )
                                    ]
                                  )
                                ]
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.0, right: 25.0, top: .0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    controller: nombreController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca el nombre del grupo",
                                    ),
                                    enabled: _editable,
                                    autocorrect: _editable,
                                    
                                  ),
                                )
                              ],
                            )
                          ),
                      ],
                    )
                  )
                )
              ],
            )
          ],
        )
      )
    );
  }

    Widget getEditIcon(){
    return new Row(
      children: <Widget>[
        Tooltip(
          message: "Editar información",
          child: GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.yellow[600],
              radius: 14.0,
              child: new Icon(
                Icons.edit,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            onTap: () {
              setState(() {
                _editable = true;
              });
            },
          ),
        ),
        
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Tooltip(
            message: "Eliminar guía",
            child: GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.red,
              radius: 14.0,
              child: new Icon(
                Icons.delete,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            onTap: () {
              setState(() {
      //          _editable = true;
              });
            },
          ),
          )

        )
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/secciones/listaturistas.dart';

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
  TextEditingController integrantesController;
  List<Turista> _turistas;
  String _tipoGrupo;

  List<String> _tipos = ["Tipo 1", "Tipo 2", "Tipo 3"];
  List<DropdownMenuItem<String>> _tiposDropdown;

  void initState(){
    super.initState();

    nombreController = new TextEditingController();
    descripcionController = new TextEditingController();
    interesesController = new TextEditingController();
    restriccionesController = new TextEditingController();
    integrantesController = new TextEditingController();
    _tiposDropdown = getDropdownItems();

    if(grupo != null){
      nombreController.text = grupo.nombreGrupo;
      descripcionController.text = grupo.descripcion;
      interesesController.text = grupo.intereses;
      restriccionesController.text = grupo.restricciones;
      integrantesController.text = grupo.numIntegrantes.toString();
      _tipoGrupo = grupo.tipo;
      _turistas = grupo.turistas;
    }else{
      nombreController.text = "";
      descripcionController.text = "";
      interesesController.text = "";
      restriccionesController.text = "";
      integrantesController.text = "0";
      _tipoGrupo = _tiposDropdown[0].value;
      _editable = true;
      _turistas = new List<Turista>();
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems(){
    List<DropdownMenuItem<String>> items = new List();

    for(String tipo in _tipos){
      items.add(new DropdownMenuItem(
        value: tipo,
        child: new Text(tipo),
      ));
    }
    return items;
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
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                //  _status ? _getEditButtons() : new Container()
                                  Container(
                                    child: getEditButtons()
                                  )
                                ],
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
                                      new Text("Descripción",
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
                            left: 25.0, right: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    controller: descripcionController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca la descripción del grupo",
                                    ),
                                    enabled: _editable,
                                    autocorrect: _editable,
                                  ),
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
                                      new Text("Intereses",
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
                            left: 25.0, right: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    controller: interesesController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca los intereses del grupo",
                                    ),
                                    enabled: _editable,
                                    autocorrect: _editable,
                                  ),
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
                                      new Text("Restricciones",
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
                            left: 25.0, right: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: new TextField(
                                    controller: restriccionesController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca las restricciones del grupo",
                                    ),
                                    enabled: _editable,
                                    autocorrect: _editable,
                                  ),
                                )
                              ],
                            )
                          ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text("Integrantes",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text("Tipo",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ),
                                flex: 2,
                              )
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: new TextField(
                                    controller: integrantesController,
                                    enabled: false,
                                    autocorrect: _editable,
                                  ),
                                ),
                                flex: 2,
                              ),
                              new Flexible(
                                child: new DropdownButton(
                                  value: _tipoGrupo,
                                  items: _tiposDropdown,
                                  onChanged: changedDropdownItem,
                                ),
                                flex: 2,
                              ),
                            ],
                          )
                        ),
                        Container(
                          child: getListIntegrantesButton(),
                        ),
                        _editable ? new Divider(color: Colors.grey, thickness: 1, indent: 24, endIndent: 24,) : new Container(),
                        _editable ? getSaveButton() : new Container(),
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


  Widget getEditButtons(){
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
            message: "Eliminar grupo",
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

  Widget getListIntegrantesButton(){
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
                child: Container(
                  child: new RaisedButton(
                    child: new Text("Integrantes del grupo"),
                    textColor: Colors.white,
                    color: Colors.cyan,
                    onPressed: () {

                      setState(() {
                        _esperarResultado(context);
                      });
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    ),
                  )
                )
              )
          ),
        ],
      )
    );
  }

  Widget getSaveButton(){
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
                child: Container(
                  child: new RaisedButton(
                    child: new Text("Guardar y salir"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    ),
                  )
                )
              )
          ),
        ],
      )
    );
  }

  void changedDropdownItem(String tipoSeleccionado){
    setState((){
      _tipoGrupo = tipoSeleccionado;
    });
  }

  void _esperarResultado(BuildContext context) async{

    final listaTuristaActualizado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListadoTuristas(turistas: _turistas),)
    );
    setState((){
      if(listaTuristaActualizado != null){
        grupo.turistas = listaTuristaActualizado;
        _turistas = listaTuristaActualizado;
      }
    });
  }  

}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
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
  String _tipoGrupo;
  String _foto;

  List<String> _tipos = ["Estudiantes", "Jubilados", "Familiar"];
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
      _foto = grupo.foto;
    }else{
      nombreController.text = "";
      descripcionController.text = "";
      interesesController.text = "";
      restriccionesController.text = "";
      integrantesController.text = "0";
      _tipoGrupo = _tiposDropdown[0].value;
      _foto = "imagenes/grupo.jpg";
      _editable = true;
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
                  height: 180.0,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: new Stack(fit: StackFit.loose,
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(_foto),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                          _editable ? getFotoButton() : new Container(),
                        ])
                      )
                    ],
                  )
                ),
                new Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
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
                            left: 25.0, right: 25.0, top: 2.0),
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
                                    maxLines: 3,
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
                                    maxLines: 2,
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

  Widget getFotoButton(){
    return new Padding(
      padding: EdgeInsets.only(top: 90.0, right: 100.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Tooltip(
            message: "Editar foto",
            child: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.red,
                radius: 25.0,
                child: new Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                )
              ),
              onTap: () {
                
              }
            ),
          )
        ],
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
                _mostrarDialogo();
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
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
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
                      if(grupo == null){
                        _mostrarConfirmacion();
                      }else{
                        _esperarResultado(context);
                      }
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
                        if(grupo == null){
                          if(nombreController.text != "" && descripcionController.text != "" && _tipoGrupo != ""){
                            GrupoTurista nuevoGrupo = new GrupoTurista(nombreController.text, _tipoGrupo, descripcionController.text, interesesController.text, restriccionesController.text, _foto);
                            grupo.setNumIntegrantes();
                            datos.grupoTurista.add(nuevoGrupo);
                            Navigator.pop(context, datos);
                          }else{
                            _mostrarError();
                          }
                        }else{
                          if(nombreController.text != "" && descripcionController.text != "" && _tipoGrupo != ""){
                            if(datos.grupoTurista.contains(grupo)){
                              int index = datos.grupoTurista.indexOf(grupo);
                              grupo.nombreGrupo = nombreController.text;
                              grupo.tipo = _tipoGrupo;
                              grupo.descripcion = descripcionController.text;
                              grupo.intereses = interesesController.text;
                              grupo.restricciones = restriccionesController.text;
                              grupo.foto = _foto;
                              grupo.setNumIntegrantes();

                              datos.grupoTurista.removeAt(index);
                              datos.grupoTurista.insert(index, grupo);
                              Navigator.pop(context, datos);
                            }
                          }else{
                            _mostrarError();
                          }
                        }
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

  void _mostrarConfirmacion(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Grupo no guardado"),
          content: new Text("Este grupo es nuevo y no ha sido guardado aún. ¿Guardar y continuar con sus integrantes?"),
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                new FlatButton(
                  child: new Text("Continuar"),
                  onPressed: () async{
                    Navigator.pop(context);
                    grupo = new GrupoTurista(nombreController.text, _tipoGrupo, descripcionController.text, interesesController.text, restriccionesController.text, _foto);
                    datos.grupoTurista.add(grupo);

                    final nuevosDatos = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListadoTuristas(datos: datos, grupo: grupo))
                    );

                    setState(() {
                      if(nuevosDatos != null){
                        datos = nuevosDatos;
                      }
                    });
                  }
                )
              ],
            )
          ],
        );
      }
    );
  }

  void _esperarResultado(BuildContext context) async{

    final listaTuristaActualizado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListadoTuristas(datos: datos, grupo: grupo))
    );
    setState((){
      if(listaTuristaActualizado != null){
        grupo.turistas = listaTuristaActualizado;
        grupo.setNumIntegrantes();
        interesesController.text = grupo.numIntegrantes.toString();
      }
    });
  }

  void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Eliminar grupo"),
          content: new Text("Estás a punto de eliminar el grupo " + nombreController.text+ "y todos sus integrantes. ¿Continuar?"),
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                new FlatButton(
                  child: new Text("Eliminar"),
                  onPressed: (){

                    if(datos.grupoTurista.contains(grupo)){
                      for(int i = 0; i < grupo.turistas.length; i++){
                        if(datos.turistasGeneral.contains(grupo.turistas[i])){
                          datos.turistasGeneral.remove(grupo.turistas[i]);
                        }
                      }
                      datos.grupoTurista.remove(grupo);
                    }
                    Navigator.pop(context);
                    Navigator.pop(context, datos);
                  }
                )
              ],
            )
          ],
        );
      }
    );
  }

  void _mostrarError(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("¡Error!"),
          content: new Text("Todos los campos editables, salvo restricciones e intereses, son obligatorios, revíselos."),
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Aceptar"),
                  onPressed: (){
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
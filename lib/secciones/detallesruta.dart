import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/listapuntointeres.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';

class DetallesRuta extends StatefulWidget {
  Ruta ruta;
  DatosPrueba datos;

  DetallesRuta({Key key, this.datos, this.ruta}) : super(key: key);

  @override
  _DetallesRutaState createState() => _DetallesRutaState(ruta: ruta);
}

class _DetallesRutaState extends State<DetallesRuta>
    with SingleTickerProviderStateMixin {
  DatosPrueba datos;
  Ruta ruta;

  _DetallesRutaState({this.ruta});

  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController estadoController;
  TextEditingController costeController;
  TextEditingController opinionesController;
  TextEditingController incidenciasController;
  TextEditingController sugerenciasController;
  TextEditingController localidadController;
  int _puntuacion;
  String _foto;
  List<PuntoInteres> _puntoInteres;

  void initState() {
    super.initState();

    nombreController = new TextEditingController();
    estadoController = new TextEditingController();
    costeController = new TextEditingController();
    opinionesController = new TextEditingController();
    incidenciasController = new TextEditingController();
    sugerenciasController = new TextEditingController();
    localidadController = new TextEditingController();

    if (ruta != null) {
      nombreController.text = ruta.nombre;
      estadoController.text = ruta.estado;
      costeController.text = ruta.coste.toString();
      opinionesController.text = ruta.opiniones;
      incidenciasController.text = ruta.incidencias;
      sugerenciasController.text = ruta.sugerencias;
      localidadController.text = ruta.localidad;
      _puntoInteres = ruta.puntoInteres;
      _puntuacion = ruta.puntuacion;
      _foto = ruta.foto;
    } else {
      nombreController.text = "";
      estadoController.text = "";
      costeController.text = "";
      opinionesController.text = "";
      incidenciasController.text = "";
      sugerenciasController.text = "";
      localidadController.text = "";
      _puntuacion = 0;
      _foto = "imagenes/rutagenerica.jpg";
      _editable = true;
      _puntoInteres = new List<PuntoInteres>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Ruta")),
        body: new Container(
            color: Colors.white,
            child: new ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    new Container(
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.2,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0)),
                        child: Image(
                          image: AssetImage(_foto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        left: 20.0,
                        bottom: 20.0,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              nombreController.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                new Text(
                                  localidadController.text,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20.0,
                                  )
                                )
                              ],
                            )
                          ],
                        )),
                    Positioned(
                      right: 15.0,
                      bottom: 20.0,
                      child: _editable ? getFotoButton() : new Container(),
                    ),
                  ],
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
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 20.0),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text("Información general",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(child: getEditButtons())
                                      ],
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              "Nombre",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
                                          hintText: "Introduzca el nombre",
                                        ),
                                        enabled: _editable,
                                        autocorrect: _editable,
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          "Estado",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          "Coste",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: new TextField(
                                          controller: estadoController,
                                          decoration: const InputDecoration(
                                            hintText: "Introduzca el estado",
                                          ),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    new Flexible(
                                      child: new TextField(
                                        controller: costeController,
                                        decoration: const InputDecoration(
                                          hintText: "Introduzca el coste",
                                        ),
                                        enabled: _editable,
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          "Localidad",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          "Puntuación",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: new TextField(
                                          controller: localidadController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Introduzca la localidad"),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    new Flexible(
                                      child: _crearEstrellas(),
                                      flex: 2,
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              "Opiniones",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        controller: opinionesController,
                                        decoration: const InputDecoration(
                                          hintText: "Introduzca la opinión",
                                        ),
                                        enabled: false,
                                        autocorrect: _editable,
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              "Incidencias",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        controller: incidenciasController,
                                        decoration: const InputDecoration(
                                          hintText:
                                              "Introduzca las incidencias",
                                        ),
                                        enabled: false,
                                        autocorrect: _editable,
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              "Sugerencias",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        controller: sugerenciasController,
                                        decoration: const InputDecoration(
                                          hintText:
                                              "Introduzca las sugerencias",
                                        ),
                                        enabled: false,
                                        autocorrect: _editable,
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                              child: getListPuntoInteresButton(),
                            ),
                            _editable ? new Divider(color: Colors.grey, thickness: 1, indent: 24, endIndent: 24,) : new Container(),
                            _editable ? getSaveButton() : new Container(),
                          ],
                        )))
              ],
            )));
  }

  Text _crearEstrellas() {
    String estrellas = '';

    for (int i = 0; i < _puntuacion; i++) {
      estrellas += '⭐ ';
    }
    estrellas.trim();
    return Text(estrellas);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getListPuntoInteresButton() {
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
              child: new Text("Puntos de interés en esta ruta"),
              textColor: Colors.white,
              color: Colors.cyan,
              onPressed: () {
                setState(() {
                  _esperarResultado(context);
                });
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
            )))),
          ],
        ));
  }

  Widget getSaveButton() {
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
                  borderRadius: new BorderRadius.circular(20.0)),
            )))),
          ],
        ));
  }

  Widget getFotoButton(){
    return new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Tooltip(
            message: "Editar foto",
            child: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.orange[700],
                radius: 15.0,
                child: new Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20.0,
                )
              ),
              onTap: () {
                
              }
            ),
          )
        ],
      );
  }

  Widget getEditButtons() {
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
              message: "Eliminar ruta",
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
            ))
      ],
    );
  }

    void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("¿Eliminar ruta?"),
          content: new Text("Estás a punto de eliminar " + nombreController.text+ ". ¿Continuar?"),
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
                  onPressed: (){
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

  void _esperarResultado(BuildContext context) async{

    final listaPuntoInteresActualizado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListadoPuntoInteres(puntoInteres: _puntoInteres),)
    );
    setState((){
      if(listaPuntoInteresActualizado != null){
        ruta.puntoInteres = listaPuntoInteresActualizado;
        _puntoInteres = listaPuntoInteresActualizado;
      }
    });
  }


}

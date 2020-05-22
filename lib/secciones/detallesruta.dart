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
  TextEditingController sugerenciasController;
  TextEditingController localidadController;
  TextEditingController fechaController;
  TextEditingController horaInicioController;
  TextEditingController horaFinController;
  String _foto;
  List<PuntoInteres> _puntoInteres;
  TimeOfDay _horaInicio;
  TimeOfDay _horaFin;
  DateTime _fecha;

  void initState() {
    super.initState();

    nombreController = new TextEditingController();
    estadoController = new TextEditingController();
    costeController = new TextEditingController();
    opinionesController = new TextEditingController();
    sugerenciasController = new TextEditingController();
    localidadController = new TextEditingController();
    fechaController = new TextEditingController();
    horaInicioController = new TextEditingController();
    horaFinController = new TextEditingController();
    _horaInicio = TimeOfDay.now();
    _horaFin = TimeOfDay.now();
    _fecha = DateTime.now();

    if (ruta != null) {
      nombreController.text = ruta.nombre;
      estadoController.text = ruta.estado;
      costeController.text = ruta.coste.toString();
      opinionesController.text = ruta.opiniones;
      sugerenciasController.text = ruta.sugerencias;
      localidadController.text = ruta.localidad;
      fechaController.text = ruta.fecha;
      horaInicioController.text = ruta.horaInicio;
      horaFinController.text = ruta.horaFin;
      _puntoInteres = ruta.puntoInteres;
      _foto = ruta.foto;
    } else {
      nombreController.text = "";
      estadoController.text = "";
      costeController.text = "";
      opinionesController.text = "";
      sugerenciasController.text = "";
      localidadController.text = "";
      fechaController.text = "";
      horaInicioController.text = "";
      horaFinController.text = "";
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
                      height: MediaQuery.of(context).size.width * 0.30,
                      width: MediaQuery.of(context).size.height,
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
                                backgroundColor: Colors.black45
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                new Text(
                                  localidadController.text,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20.0,
                                    backgroundColor: Colors.black
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
                                          "Coste(€)",
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
                                        keyboardType: TextInputType.number,
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
                                      child: _editable ? new Container(width: 20) : new Container(),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          "Fecha",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: _editable ? getFechaButton() : new Container(),
                                    ),
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
                                      child: new TextField(
                                        controller: fechaController,
                                        decoration: const InputDecoration(
                                          hintText: "Introduzca una fecha para esta ruta"
                                        ),
                                        keyboardType: TextInputType.datetime,
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ),
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
                                          "Hora de inicio",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: _editable ? getHoraInicioButton() : new Container(),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: new Text(
                                          "Hora de fin",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    Expanded(
                                      child: _editable ? getHoraFinButton() : new Container(),
                                    ),                                    
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
                                          controller: horaInicioController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Introduzca la hora de inicio"),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                          keyboardType: TextInputType.datetime,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    new Flexible(
                                      child: new TextField(
                                        controller: horaFinController,
                                        decoration: const InputDecoration(
                                          hintText: "Introduzca la hora de fin"
                                        ),
                                        enabled: _editable,
                                        autocorrect: _editable,
                                        keyboardType: TextInputType.datetime,
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                )
                              ),
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

  Widget getHoraInicioButton() {
      return Tooltip(
          message: "Editar hora de inicio",
          child: GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.yellow[300],
              radius: 13.0,
              child: new Icon(
                Icons.alarm,
                color: Colors.black,
                size: 15.0,
              ),
            ),
            onTap: () {
              seleccionarHoraInicio(context);
            },
          ),
        );

  }

  Widget getHoraFinButton() {
      return Tooltip(
          message: "Editar hora de fin",
          child: GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.yellow[300],
              radius: 13.0,
              child: new Icon(
                Icons.alarm,
                color: Colors.black,
                size: 15.0,
              ),
            ),
            onTap: () {
              seleccionarHoraFin(context);
            },
          ),
        );

  }

  Widget getFechaButton() {
      return Tooltip(
          message: "Editar fecha",
          child: GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.yellow[300],
              radius: 13.0,
              child: new Icon(
                Icons.calendar_today,
                color: Colors.black,
                size: 15.0,
              ),
            ),
            onTap: () {
              seleccionarFecha(context);
            },
          ),
        );

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

  Future<Null> seleccionarHoraInicio(BuildContext context) async{

    _horaInicio = await showTimePicker(
      context: context,
      initialTime: _horaInicio,
    );

    setState(() {
      horaInicioController.text = _horaInicio.hour.toString() + ":" + _horaInicio.minute.toString();
    });

  }

  Future<Null> seleccionarHoraFin(BuildContext context) async{

    _horaFin = await showTimePicker(
      context: context,
      initialTime: _horaFin,
    );

    setState(() {
      horaFinController.text = _horaFin.hour.toString() + ":" + _horaFin.minute.toString();
    });

  }

  Future<Null> seleccionarFecha(BuildContext context) async {

    _fecha = await showDatePicker(
      context: context,
      initialDate: _fecha,
      firstDate: DateTime(2020),
      lastDate: DateTime(2200),
    );

    setState(() {
      fechaController.text = _fecha.day.toString() + "/" + _fecha.month.toString() + "/" + _fecha.year.toString();
    });
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_ipo2/modelos/turista.dart';


class DetallesTurista extends StatefulWidget{

  Turista turista;

  DetallesTurista({Key key, this.turista}) : super(key: key);

  @override
  _DetallesGuiaState createState() => _DetallesGuiaState(turista: turista);

}

class _DetallesGuiaState extends State<DetallesTurista> with SingleTickerProviderStateMixin{

  Turista turista;

  _DetallesGuiaState({this.turista});
  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController apellidosController;
  TextEditingController movilController;
  TextEditingController dniController;
  TextEditingController correoController;
  TextEditingController edadController;
  String _foto;

  void initState(){
    super.initState();

    nombreController = new TextEditingController();
    apellidosController = new TextEditingController();
    movilController = new TextEditingController();
    dniController = new TextEditingController();
    correoController = new TextEditingController();
    edadController = new TextEditingController();

  if(turista != null){
    nombreController.text = turista.nombre;
    apellidosController.text = turista.apellidos;
    movilController.text = turista.movil.toString();
    dniController.text = turista.dni;
    correoController.text = turista.correo;
    _foto = turista.foto;
    edadController.text = turista.edad.toString();
  }else{
    nombreController.text = "";
    apellidosController.text = "";
    movilController.text = "";
    dniController.text = "";
    correoController.text = "";
    edadController.text = "";
    _foto = "imagenes/personagenerica.png";
    _editable = true;
    
  }


    
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Turista"),
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  height: 250.0,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
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
                          padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text("Información personal",
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
                                      new Text("Nombre",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                                      hintText: "Introduzca su nombre",
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
                                      new Text("Apellidos",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: apellidosController,
                                  decoration: const InputDecoration(
                                    hintText: "Introduzca sus apellidos",
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
                                      new Text("Correo electrónico",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: correoController,
                                  decoration: const InputDecoration(
                                    hintText: "Introduzca su correo electrónico",
                                  ),
                                  keyboardType: TextInputType.emailAddress,
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
                                      new Text("DNI",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: correoController,
                                  decoration: const InputDecoration(
                                    hintText: "Introduzca su DNI",
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
                                  child: new Text("Edad",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text("Teléfono",
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
                                    controller: edadController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca su edad"
                                    ),
                                    enabled: _editable,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                                  ),
                                ),
                                flex: 2,
                              ),
                              new Flexible(
                                child: new TextField(
                                  controller: movilController,
                                  decoration: const InputDecoration(
                                    hintText: "Introduzca su teléfono"
                                  ),
                                  enabled: _editable,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                                ),
                                flex: 2,
                              ),
                            ],
                          )
                        ),
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

  @override
  void dispose(){
    super.dispose();
    nombreController.dispose();
    apellidosController.dispose();
    movilController.dispose();
    dniController.dispose();
    correoController.dispose();
    edadController.dispose();
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
            message: "Eliminar turista",
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
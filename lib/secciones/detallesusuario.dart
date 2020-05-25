import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/usuario.dart';


class DetallesUsuario extends StatefulWidget{
  
  DatosPrueba datos;
  Usuario usuario;

  DetallesUsuario({Key key, @required this.datos, @required this.usuario}) : super(key: key);
  @override
  _DetallesUsuarioState createState() => _DetallesUsuarioState(datos: datos, usuario: usuario);

}

class _DetallesUsuarioState extends State<DetallesUsuario> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  Usuario usuario;
  _DetallesUsuarioState({@required this.datos, @required this.usuario});
  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController correoController;
  TextEditingController movilController;
  TextEditingController conexionController;
  String _foto;

  void initState(){
    super.initState();
    nombreController = new TextEditingController();
    nombreController.text = usuario.nombreUsuario;

    correoController = new TextEditingController();
    correoController.text = usuario.correo;

    movilController = new TextEditingController();
    movilController.text = usuario.telefono.toString();

    conexionController = new TextEditingController();
    conexionController.text = usuario.ultimaConexion;

    _foto = usuario.foto;

  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Perfil"),
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  height: 200.0,
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
                                  enabled: _editable,
                                  autocorrect: _editable,
                                  keyboardType: TextInputType.emailAddress,
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
                                      new Text("Teléfono",
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
                                  controller: movilController,
                                  decoration: const InputDecoration(
                                    hintText: "Introduzca su móvil",
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                                  enabled: _editable,
                                  autocorrect: _editable,
                                )
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
                                      new Text("Última conexión",
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
                                  controller: conexionController,
                                  enabled: false,
                                  autocorrect: false,
                                )
                              )
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
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                child: Container(
                  child: new RaisedButton(
                    child: new Text("Guardar y salir"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        if(nombreController.text != "" && correoController.text != "" && movilController.text != ""){
                          usuario.nombreUsuario = nombreController.text;
                          usuario.foto = _foto;
                          usuario.correo = correoController.text;
                          usuario.telefono = int.parse(movilController.text);
                          Navigator.pop(context, usuario);
                        }else{
                          _mostrarError();
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
          ),
        ],
      )
    );
  }
  Widget getEditButtons() {
    return new Tooltip(
      message: "Editar información",
      child: GestureDetector(
        child: new CircleAvatar(
          backgroundColor: Colors.yellow[600],
          radius: 14.0,
          child: new Icon(
            Icons.edit,
            color: Colors.white,
            size: 16.0
          ),
        ),
        onTap: () {
          setState(() {
            _editable = true;
          });
        },
      )
    );
  }

  void _mostrarError(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("¡Error!"),
          content: new Text("Todos los campos editables son obligatorios, revíselos."),
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
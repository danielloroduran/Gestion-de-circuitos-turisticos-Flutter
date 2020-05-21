import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/turista.dart';

import 'listadoturistaspromo.dart';
import 'listaturistas.dart';

class DetallesPromo extends StatefulWidget {
  Promocion promo;
  DatosPrueba datos;

  DetallesPromo({Key key, this.datos, this.promo}) : super(key: key);

  @override
  _DetallesPromoState createState() => _DetallesPromoState(datos: datos, promo: promo);
}

class _DetallesPromoState extends State<DetallesPromo>
    with SingleTickerProviderStateMixin {
  DatosPrueba datos;
  Promocion promo;

  _DetallesPromoState({this.datos, this.promo});

  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController mensajeController;
  TextEditingController precioController;
  TextEditingController descuentoController;
  TextEditingController precioFinalController;
  TextEditingController localidadController;
  List<Turista> _turistas;
  String _foto;

  void initState() {
    super.initState();

    nombreController = new TextEditingController();
    mensajeController = new TextEditingController();
    precioController = new TextEditingController();
    descuentoController = new TextEditingController();
    precioFinalController = new TextEditingController();
    localidadController = new TextEditingController();
    _turistas = datos.turistasGeneral;

    if (promo != null) {
      nombreController.text = promo.nombrePromo;
      mensajeController.text = promo.mensaje;
      precioController.text = promo.precio.toString();
      descuentoController.text = promo.descuento.toString();
      precioFinalController.text = promo.precioFinal.toString();
      localidadController.text = promo.localidad;
      _foto = promo.foto;
    } else {
      nombreController.text = "";
      mensajeController.text = "";
      precioController.text = "";
      descuentoController.text = "";
      precioFinalController.text = "";
      localidadController.text = "";
      _foto = "imagenes/rutagenerica.jpg";
      _editable = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Promociones")),
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
                    )
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
                                          "Mensaje",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      flex: 2,
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
                                          controller: mensajeController,
                                          decoration: const InputDecoration(
                                            hintText: "Introduzca el mensaje",
                                          ),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                        ),
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
                                          "Precio(€)",
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
                                          "Descuento(%)",
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
                                          controller: precioController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Introduzca el precio inicial"),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    new Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: new TextField(
                                          controller: descuentoController ,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Introduzca el descuento"),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                          keyboardType: TextInputType.number,
                                        ),
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
                                              "Precio final(€)",
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
                                        controller: precioFinalController,
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
                                              "Localidad",
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
                                        controller: localidadController,
                                        decoration: const InputDecoration(
                                          hintText:
                                              "Introduzca la localidad",
                                        ),
                                        enabled: _editable,
                                        autocorrect: _editable,
                                      ),
                                    )
                                  ],
                                )),
                            Container(
                              child: getListEnviarAButton(),
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

  Widget getListEnviarAButton(){
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
                    child: new Text("Enviar a..."),
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
              message: "Eliminar promoción",
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

  void _esperarResultado(BuildContext context) {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListadoTuristasPromo(turistas: _turistas)),
    );
  }

  void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("¿Eliminar promoción?"),
          content: new Text("Estás a punto de eliminar la promoción " + nombreController.text+ ". ¿Continuar?"),
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

}
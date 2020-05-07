import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';

class DetallesPuntoInteres extends StatefulWidget{

  PuntoInteres puntoInteres;

  DetallesPuntoInteres({Key key, this.puntoInteres}) : super(key: key);

  @override
  _DetallesPuntoInteresState createState() => _DetallesPuntoInteresState(puntoInteres: puntoInteres);

}

class _DetallesPuntoInteresState extends State<DetallesPuntoInteres> with SingleTickerProviderStateMixin{

  PuntoInteres puntoInteres;

  _DetallesPuntoInteresState({this.puntoInteres});

  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController tipoController;
  TextEditingController entradaController;
  TextEditingController descripcionController;
  TextEditingController horarioController;
  TextEditingController duracionVisitaController;
  String _foto;
  String _tipoPuntoInteres;

  List<String> _tipos = ["Iglesia", "Museo", "Plaza", "Exposición", "Estatua", "Restaurante", "Bar", "Tienda", "Otro"];
  List<DropdownMenuItem<String>> _tiposDropdown;

  void initState(){
    super.initState();

    nombreController = new TextEditingController();
    tipoController = new TextEditingController();
    entradaController = new TextEditingController();
    descripcionController = new TextEditingController();
    horarioController = new TextEditingController();
    duracionVisitaController = new TextEditingController();
    _tiposDropdown = getDropdownItems();

    if(puntoInteres != null){
      nombreController.text = puntoInteres.nombre;
      tipoController.text = puntoInteres.tipo;
      entradaController.text = puntoInteres.entrada;
      descripcionController.text = puntoInteres.descripcion;
      horarioController.text = puntoInteres.horario;
      duracionVisitaController.text = puntoInteres.duracionVisita;
      _foto = puntoInteres.foto;
      _tipoPuntoInteres = puntoInteres.tipo;
    }else{
      nombreController.text = "";
      entradaController.text = "";
      descripcionController.text = "";
      horarioController.text = "";
      duracionVisitaController.text = "";
      _foto = "imagenes/puntoInteresgenerico.jpg";
      _tipoPuntoInteres = _tiposDropdown[0].value;
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
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
                borderRadius: BorderRadius.circular(30.0),
                child: Image(
                  image: AssetImage(_foto),
                  fit: BoxFit.cover,
                ),
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0, bottom: 20.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(puntoInteres.nombre,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,),
                    ),
                  ],
                )
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
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text("Información general",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
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
                                  fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
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
                          child: new TextField(
                            controller: nombreController,
                            decoration: const InputDecoration(
                              hintText: "Introduzca el nombre",
                            ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: new Text("Tipo",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            child: new Text("Entrada",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                            ),
                          ),
                          flex: 2,
                        ),
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
                          child: new DropdownButton(
                            value: _tipoPuntoInteres,
                            items: _tiposDropdown,
                            onChanged: changedDropdownItem,
                          ),
                          flex: 2,
                        ),
                        new Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: new TextField(
                              controller: entradaController,
                              decoration: const InputDecoration(
                                hintText: "Introduzca el valor de la entrada",
                              ),
                              enabled: _editable,
                              autocorrect: _editable,
                            )
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
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text("Descripción",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]
                                )
                              ]
                            )
                          ]
                        )
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            controller: descripcionController,
                            decoration: const InputDecoration(
                              hintText: "Introduzca la descripción",
                            ),
                          )
                        )
                      ],
                    ),
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
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text("Horario",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                    ),
                                  ]
                                )
                              ]
                            )
                          ]
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
                          child: new TextField(
                            controller: horarioController,
                            decoration: const InputDecoration(
                              hintText: "Introduzca el horario",
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
                                new Text("Duración de la visita",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
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
                          child: new TextField(
                            controller: duracionVisitaController,
                            decoration: const InputDecoration(
                              hintText: "Introduzca la duración de la visita"
                            ),
                            enabled: _editable,
                            autocorrect: _editable,
                          )
                        )
                      ],
                    )
                  )
                ],
              )
            ),
          ),
          Container(
            child: getSaveButton(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
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

  void changedDropdownItem(String tipoSeleccionado){
    setState((){
      _tipoPuntoInteres = tipoSeleccionado;
    });
  }  

}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/ruta.dart';

class DetallesPuntoInteres extends StatefulWidget{
  
  DatosPrueba datos;
  PuntoInteres puntoInteres;
  Ruta ruta;

  DetallesPuntoInteres({Key key, this.datos, this.puntoInteres, this.ruta}) : super(key: key);

  @override
  _DetallesPuntoInteresState createState() => _DetallesPuntoInteresState(datos, puntoInteres, ruta);

}

class _DetallesPuntoInteresState extends State<DetallesPuntoInteres> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  PuntoInteres puntoInteres;
  Ruta ruta;

  _DetallesPuntoInteresState(this.datos, this.puntoInteres, this.ruta);

  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController entradaController;
  TextEditingController descripcionController;
  TextEditingController direccionController;
  TextEditingController horarioController;
  TextEditingController duracionVisitaController;
  String _foto;
  String _tipoPuntoInteres;

  List<String> _tipos = ["Iglesia", "Museo", "Plaza", "Exposición", "Estatua", "Restaurante", "Bar", "Tienda", "Otro"];
  List<DropdownMenuItem<String>> _tiposDropdown;

  void initState(){
    super.initState();

    nombreController = new TextEditingController();
    entradaController = new TextEditingController();
    descripcionController = new TextEditingController();
    direccionController = new TextEditingController();
    horarioController = new TextEditingController();
    duracionVisitaController = new TextEditingController();
    _tiposDropdown = getDropdownItems();

    if(puntoInteres != null){
      nombreController.text = puntoInteres.nombre;
      entradaController.text = puntoInteres.entrada;
      descripcionController.text = puntoInteres.descripcion;
      horarioController.text = puntoInteres.horario;
      direccionController.text = puntoInteres.direccion;
      duracionVisitaController.text = puntoInteres.duracionVisita;
      _foto = puntoInteres.foto;
      _tipoPuntoInteres = puntoInteres.tipo;
    }else{
      nombreController.text = "";
      entradaController.text = "";
      descripcionController.text = "";
      horarioController.text = "";
      direccionController.text = "";
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
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Punto de interés"),
      ),
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
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
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
                                backgroundColor: Colors.black45,
                              ),
                            ),
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
                                          "Entrada",
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
                                          "Tipo",
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
                                          controller: entradaController,
                                          decoration: const InputDecoration(
                                            hintText: "Introduzca el precio de la entrada",
                                          ),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    new Flexible(
                                      child: new DropdownButton(
                                        value: _tipoPuntoInteres,
                                        items: _tiposDropdown,
                                        onChanged: changedDropdownItem,
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
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text("Dirección",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        controller: direccionController,
                                        decoration: const InputDecoration(
                                          hintText: "Introduzca la dirección",
                                        ),
                                        enabled: _editable,
                                        autocorrect: _editable,
                                      )
                                    )
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
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text("Descripción",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
                                        maxLines: 2,
                                        enabled: _editable,
                                        autocorrect: _editable,
                                      )
                                    )
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
                                          "Duración",
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
                                          "Horario",
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
                                          controller: duracionVisitaController,
                                          decoration: const InputDecoration(
                                            hintText: "Introduzca la duración",
                                          ),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    new Flexible(
                                      child: new TextField(
                                        controller: horarioController,
                                        decoration: const InputDecoration(
                                          hintText: "Introduzca el horario",
                                        ),
                                        enabled: _editable,
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                )),
                            _editable ? getSaveButton() : new Container(),
                          ],
                        )))
              ],
            )));
  }

  @override
  void dispose(){
    super.dispose();
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
            message: "Eliminar punto de interés",
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
                        if(puntoInteres == null){
                          if(nombreController.text != "" && _tipoPuntoInteres != "" && entradaController.text != "" && descripcionController.text != "" && horarioController.text != "" && duracionVisitaController.text != "" && direccionController.text != ""){
                            PuntoInteres nuevoPunto = new PuntoInteres(nombreController.text, _tipoPuntoInteres, _foto, entradaController.text, descripcionController.text, direccionController.text, horarioController.text, duracionVisitaController.text);
                            datos.puntoInteres.add(nuevoPunto);
                            if(datos.rutas.contains(ruta)){
                              int index = datos.rutas.indexOf(ruta);
                              datos.rutas.elementAt(index).puntoInteres.add(nuevoPunto);
                            }else{
                              ruta.puntoInteres.add(nuevoPunto);
                            }
                            Navigator.pop(context, datos);
                          }else{
                            _mostrarError();
                          } 
                        }else{
                          if(nombreController.text != "" && _tipoPuntoInteres != "" && entradaController.text != "" && descripcionController.text != "" && horarioController.text != "" && duracionVisitaController.text != "" && direccionController.text != ""){
                            if(datos.puntoInteres.contains(puntoInteres)){
                              int index = datos.puntoInteres.indexOf(puntoInteres);
                              puntoInteres.nombre = nombreController.text;
                              puntoInteres.tipo = _tipoPuntoInteres;
                              puntoInteres.foto = _foto;
                              puntoInteres.entrada = entradaController.text;
                              puntoInteres.descripcion = descripcionController.text;
                              puntoInteres.direccion = direccionController.text;
                              puntoInteres.horario = horarioController.text;
                              puntoInteres.duracionVisita = duracionVisitaController.text;

                              datos.puntoInteres.removeAt(index);
                              datos.puntoInteres.insert(index, puntoInteres);

                              if(datos.rutas.contains(ruta)){
                                int index = datos.rutas.indexOf(ruta);
                                int indexP = datos.rutas.elementAt(index).puntoInteres.indexOf(puntoInteres);
                                datos.rutas.elementAt(index).puntoInteres.removeAt(indexP);
                                datos.rutas.elementAt(index).puntoInteres.insert(indexP, puntoInteres);
                                Navigator.pop(context, datos);
                              }

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
      _tipoPuntoInteres = tipoSeleccionado;
    });
  }  

  void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Eliminar punto de interés"),
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
                  child: new Text("Eliminar solo en ruta"),
                  onPressed: (){
                    if(datos.rutas.contains(ruta)){
                      int index = datos.rutas.indexOf(ruta);
                      int indexP = datos.rutas.elementAt(index).puntoInteres.indexOf(puntoInteres);
                      datos.rutas.elementAt(index).puntoInteres.removeAt(indexP);

                      Navigator.pop(context);
                      Navigator.pop(context, datos);
                    }
                  }
                ),
                new FlatButton(
                  child: new Text("Eliminar"),
                  onPressed: (){
                    if(datos.rutas.contains(ruta)){
                      int index = datos.rutas.indexOf(ruta);
                      int indexP = datos.rutas.elementAt(index).puntoInteres.indexOf(puntoInteres);
                      datos.rutas.elementAt(index).puntoInteres.removeAt(indexP);
                      if(datos.puntoInteres.contains(puntoInteres)){
                        datos.puntoInteres.removeAt(index);
                      }
                      Navigator.pop(context);
                      Navigator.pop(context, datos);
                    }
                  },
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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';

import 'listarutasguia.dart';


class DetallesGuia extends StatefulWidget{

  DatosPrueba datos;
  Guia guia;

  DetallesGuia({Key key,  this.datos, this.guia}) : super(key: key);

  @override
  _DetallesGuiaState createState() => _DetallesGuiaState(datos: datos, guia: guia);

}

class _DetallesGuiaState extends State<DetallesGuia> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  Guia guia;

  _DetallesGuiaState({ this.datos, this.guia});
  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController apellidosController;
  TextEditingController movilController;
  TextEditingController idiomasController;
  TextEditingController disponibilidadController;
  TextEditingController precioHoraController;
  TextEditingController precioDiaController;
  TextEditingController dniController;
  TextEditingController correoController;
  String _foto;
  int _puntuacion;

  void initState(){
    super.initState();

    nombreController = new TextEditingController();
    apellidosController = new TextEditingController();
    movilController = new TextEditingController();
    idiomasController = new TextEditingController();
    disponibilidadController = new TextEditingController();
    precioHoraController = new TextEditingController();
    precioDiaController = new TextEditingController();
    dniController = new TextEditingController();
    correoController = new TextEditingController();

  if(guia != null){
    nombreController.text = guia.nombre;
    apellidosController.text = guia.apellidos;
    movilController.text = guia.movil.toString();
    idiomasController.text = guia.idiomas;
    disponibilidadController.text = guia.disponibilidad;
    precioHoraController.text = guia.precioHora.toString();
    precioDiaController.text = guia.precioDia.toString();
    dniController.text = guia.dni;
    correoController.text = guia.correo;
    _foto = guia.foto;
    _puntuacion = guia.puntuacion;
  }else{
    nombreController.text = "";
    apellidosController.text = "";
    movilController.text = "";
    idiomasController.text = "";
    disponibilidadController.text = "";
    precioHoraController.text = "";
    precioDiaController.text = "";
    dniController.text = "";
    correoController.text = "";
    _foto = "imagenes/personagenerica.png";
    _editable = true;
    _puntuacion = 0;
    
  }


    
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Guía"),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text("DNI",
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
                                    controller: dniController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca su DNI"
                                    ),
                                    enabled: _editable,
                                    autocorrect: _editable,
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
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text("Precio por hora(€)",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text("Precio por día(€)",
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
                                    controller: precioHoraController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca el precio por hora"
                                    ),
                                    keyboardType: TextInputType.number,
                                    enabled: _editable,
                                  ),
                                ),
                                flex: 2,
                              ),
                              new Flexible(
                                child: new TextField(
                                  controller: precioDiaController,
                                  decoration: const InputDecoration(
                                    hintText: "Introduzca el precio por dia"
                                  ),
                                  enabled: _editable,
                                  keyboardType: TextInputType.number,
                                ),
                                flex: 2,
                              ),
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
                                  child: new Text("Idiomas",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text("Puntuación",
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
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: new TextField(
                                    controller: idiomasController,
                                    decoration: const InputDecoration(
                                      hintText: "Introduzca los idiomas"
                                    ),
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
                                      new Text("Disponibilidad",
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
                                  controller: disponibilidadController,
                                  decoration: const InputDecoration(
                                    hintText: "Introduzca la disponibilidad",
                                  ),
                                  enabled: _editable,
                                  autocorrect: _editable,
                                ),
                              )
                            ],
                          )
                        ),
                        Container(
                          child: getRutaButtons(),
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

  Widget getRutaButtons(){
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0, bottom: 4),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                child: new RaisedButton(
                  child: new Text("Rutas asignadas"),
                  textColor: Colors.white,
                  color: Colors.cyan,
                  onPressed: () {
                    _esperarResultado(context, 1);
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)
                  ),
                )
              )
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                child: new RaisedButton(
                  child: new Text("Rutas realizadas"),
                  textColor: Colors.white,
                  color: Colors.cyan,
                  onPressed: () {
                    setState((){
                      _esperarResultado(context, 2);
                    });
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular((20.0)),
                  )
                )
              ),
            ),
          flex: 2,
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
                        if(guia == null){
                          if(nombreController.text != "" && apellidosController.text!= "" && movilController.text != "" && idiomasController.text != "" && disponibilidadController.text != "" && precioHoraController.text != "" && precioDiaController.text != "" && dniController.text != "" && correoController.text != ""){
                            Guia nuevoGuia = new Guia(nombreController.text, apellidosController.text, int.parse(movilController.text), _foto, 0, idiomasController.text, disponibilidadController.text, double.parse(precioHoraController.text), double.parse(precioDiaController.text), dniController.text, correoController.text);
                            datos.guias.add(nuevoGuia);
                            Navigator.pop(context, datos);
                          }
                        }else{
                          if(nombreController.text != "" && apellidosController.text!= "" && movilController.text != "" && idiomasController.text != "" && disponibilidadController.text != "" && precioHoraController.text != "" && precioDiaController.text != "" && dniController.text != "" && correoController.text != ""){
                            if(datos.guias.contains(guia)){
                              int index = datos.guias.indexOf(guia);
                              guia.nombre = nombreController.text;
                              guia.apellidos = apellidosController.text;
                              guia.movil = int.parse(movilController.text);
                              guia.idiomas = idiomasController.text;
                              guia.disponibilidad = disponibilidadController.text;
                              guia.precioDia = double.parse(precioDiaController.text);
                              guia.precioHora = double.parse(precioHoraController.text);
                              guia.dni = dniController.text;
                              guia.correo = correoController.text;

                              datos.guias.removeAt(index);
                              datos.guias.insert(index, guia);
                              Navigator.pop(context, datos);
                            }
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
                _mostrarDialogo();
              });
            },
          ),
          )

        )
      ],
    );
  }

  void _esperarResultado(BuildContext context, int num) async{

    if(num == 1){
      final nuevasRutas = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListaRutasAsignadas(datos: datos, guia: guia)),
      );

      if(nuevasRutas != null){
        guia.rutasAsignadas = nuevasRutas;
      }      
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListaRutasHistorial(guia)),
      );         
    }


  }

  void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("¿Eliminar guía?"),
          content: new Text("Estás a punto de eliminar a " + nombreController.text+ ". ¿Continuar?"),
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
                    if(datos.guias.contains(guia)){
                      datos.guias.remove(guia);
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

  Text _crearEstrellas(){
    String estrellas = '';
    
      for(int i = 0; i < _puntuacion; i++){
        estrellas += '⭐ ';
      }
      estrellas.trim();
      return Text(estrellas);

  }
}
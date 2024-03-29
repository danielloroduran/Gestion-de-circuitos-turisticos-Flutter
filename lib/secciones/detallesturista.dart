import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_ipo2/datos/baseDatos.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/turista.dart';


class DetallesTurista extends StatefulWidget{

  DatosPrueba datos;
  Turista turista;
  GrupoTurista grupo;
  DetallesTurista({Key key, this.datos, this.turista, this.grupo}) : super(key: key);

  @override
  _DetallesGuiaState createState() => _DetallesGuiaState(datos, turista, grupo);

}

class _DetallesGuiaState extends State<DetallesTurista> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  Turista turista;
  GrupoTurista grupo;
  BaseDatos bd;
  _DetallesGuiaState(this.datos, this.turista, this.grupo);

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
    bd = new BaseDatos();
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
                                  controller: dniController,
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
                        _editable ? getSaveButton(context) : new Container(),
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

  Widget getSaveButton(context){
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
                        bool repetido =false;
                        if(turista == null){
                          if(nombreController.text != "" && apellidosController.text != "" && movilController.text != "" && dniController.text != "" && correoController.text != "" && edadController.text != "") {
                            Turista nuevoTurista = new Turista(dniController.text, nombreController.text, apellidosController.text, int.parse(movilController.text), correoController.text, _foto, int.parse(edadController.text));
                            for(int i = 0; i < datos.puntoInteres.length; i++){
                                if(datos.turistasGeneral.elementAt(i).nombre == nuevoTurista.nombre){
                                repetido = true;
                                }
                              }
                              if(repetido){
                                print("Objeto repetido en la BBDD");
                              }
                              else{
                                datos.turistasGeneral.add(nuevoTurista);
                                insertarBBDD(bd, nuevoTurista);
                              }
                            if(datos.grupoTurista.contains(grupo)){
                              int index = datos.grupoTurista.indexOf(grupo);
                              datos.grupoTurista.elementAt(index).turistas.add(nuevoTurista);
                              insertarBBDDGrupos(bd, grupo, nuevoTurista);
                            }else{
                              grupo.turistas.add(nuevoTurista);
                              insertarBBDD(bd, turista);
                             
                            }
                            Navigator.pop(context, datos);
                          }else{
                            _mostrarError();
                          }
                        }else{
                          if(nombreController.text != "" && apellidosController.text != "" && movilController.text != "" && dniController.text != "" && correoController.text != "" && edadController.text != "") {
                            if(datos.turistasGeneral.contains(turista)){
                              int index = datos.turistasGeneral.indexOf(turista);
                              String dniTurista = turista.dni;
                              turista.nombre = nombreController.text;
                              turista.apellidos = apellidosController.text;
                              turista.movil = int.parse(movilController.text);
                              turista.dni = dniController.text;
                              turista.foto = _foto;
                              turista.edad = int.parse(edadController.text);

                              modificarBBDD(bd, dniTurista, turista);
                              datos.turistasGeneral.removeAt(index);
                              datos.turistasGeneral.insert(index, turista);

                              if(datos.grupoTurista.contains(grupo)){
                                int index = datos.grupoTurista.indexOf(grupo);
                                int indexT = datos.grupoTurista.elementAt(index).turistas.indexOf(turista);
                                
                                modificarBBDDGrupos(bd, datos.grupoTurista.elementAt(index).nombreGrupo, turista);
                                datos.grupoTurista.elementAt(index).turistas.removeAt(indexT);
                                datos.grupoTurista.elementAt(index).turistas.insert(indexT, turista);
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
                _mostrarDialogo();
              });
            },
          ),
          )

        )
      ],
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

  void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Eliminar turista"),
          content: new Text("Estás a punto de eliminar a " + nombreController.text+ ", tanto del grupo como del sistema. ¿Continuar?"),
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
                      int index = datos.grupoTurista.indexOf(grupo);
                      int indexT = datos.grupoTurista.elementAt(index).turistas.indexOf(turista);
                      datos.grupoTurista.elementAt(index).turistas.removeAt(indexT);
                      eliminarBBDDGrupos(bd, turista.dni,datos.grupoTurista.elementAt(index).nombreGrupo);

                      if(datos.turistasGeneral.contains(turista)){
                        datos.turistasGeneral.removeAt(index);
                        eliminarBBDD(bd, datos.turistasGeneral.elementAt(index).dni);
                      }
                      Navigator.pop(context);
                      Navigator.pop(context, datos);
                    }
                  }
                )
              ],
            )
          ],
        );
      }
    );
  }
  void insertarBBDD(BaseDatos db, Turista turista) async{
    await db.initdb();
    db.insertTuristas(turista);
  }
  void modificarBBDD(BaseDatos db, String dni, Turista turista) async{
    await db.initdb();
    db.updateTuristas(dni, turista);
  }
  void eliminarBBDD(BaseDatos db, String dni) async{
    await db.initdb();
    db.deleteTuristas(dni);
  }
  void insertarBBDDGrupos(BaseDatos db, GrupoTurista gp,Turista turista) async{
    await db.initdb();
    db.insertGTTuristas(gp.nombreGrupo, turista.dni);
  }
  void modificarBBDDGrupos(BaseDatos db, String dni, Turista turista) async{
    await db.initdb();
    db.updateGTTuristas(dni, turista);
  }
  void eliminarBBDDGrupos(BaseDatos db, String dni, String grupo) async{
    await db.initdb();
    db.deleteGTTuristas(dni, grupo);
  }
}
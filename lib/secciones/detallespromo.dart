import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica_ipo2/datos/baseDatos.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/secciones/listadoturistaspromo.dart';

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
  BaseDatos bd;

  _DetallesPromoState({this.datos, this.promo});

  bool _editable = false;
  TextEditingController nombreController;
  TextEditingController mensajeController;
  TextEditingController precioController;
  TextEditingController descuentoController;
  TextEditingController precioFinalController;
  TextEditingController localidadController;
  String _foto;

  void initState() {
    super.initState();
    bd = new BaseDatos();
    nombreController = new TextEditingController();
    mensajeController = new TextEditingController();
    precioController = new TextEditingController();
    descuentoController = new TextEditingController();
    precioFinalController = new TextEditingController();
    localidadController = new TextEditingController();

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
                                          maxLines: 2,
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
                                          "Precio/persona (€)",
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
                                          "Descuento (%)",
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
                                          inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
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
                                          "Precio final/persona (€)",
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
                                          "Localidad",
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
                                          controller: precioFinalController,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Cálculo automático"),
                                          enabled: false,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
                                    new Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: new TextField(
                                          controller: localidadController ,
                                          decoration: const InputDecoration(
                                              hintText:
                                                  "Introduzca la localidad"),
                                          enabled: _editable,
                                          autocorrect: _editable,
                                        ),
                                      ),
                                      flex: 2,
                                    ),
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
                        bool repetido = false;
                        if(promo == null){
                          if(nombreController.text != "" && mensajeController.text != "" && precioController.text != "" && descuentoController.text != "" && localidadController.text != ""){
                            Promocion nuevaPromo = new Promocion(nombreController.text, mensajeController.text, double.parse(precioController.text), int.parse(descuentoController.text), _foto, localidadController.text);
                            
                            for(int i = 0; i < datos.promociones.length; i++){
                              if(datos.promociones.elementAt(i).nombrePromo == nuevaPromo.nombrePromo){
                                repetido = true;
                              }
                            }
                            if(repetido){
                              print("Objeto repetido en la BBDD");
                            }
                            else{
                              datos.promociones.add(nuevaPromo);
                              insertarBBDD(bd, nuevaPromo);
                            }
                            Navigator.pop(context, datos);
                          }else{
                            _mostrarError();
                          }
                        }else{
                          if(nombreController.text != "" && mensajeController.text != "" && precioController.text != "" && descuentoController.text != "" && localidadController.text != ""){
                            if(datos.promociones.contains(promo)){
                              int index = datos.promociones.indexOf(promo);
                              String nombrePromo = promo.nombrePromo;
                              promo.nombrePromo = nombreController.text;
                              promo.mensaje = mensajeController.text;
                              promo.precio = double.parse(precioController.text);
                              promo.descuento = int.parse(descuentoController.text);
                              promo.foto = _foto;
                              promo.localidad = localidadController.text;
                              promo.setPrecioFinal();
                              
                                modificarBBDD(bd, nombrePromo, promo);
                                datos.promociones.removeAt(index);
                                datos.promociones.insert(index, promo);
                              
                              Navigator.pop(context);
                              Navigator.pop(context, datos);

                            }
                          }else{
                            _mostrarError();
                          }                          
                        }
                      });
                    },
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                  )
                )
              )
            ),
          ],
        )
      );
  }

  Widget getListEnviarAButton(){
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
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
      MaterialPageRoute(builder: (context) => ListadoTuristasPromo(datos: datos)),
    );
  }

  void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Eliminar promoción"),
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
                  child: new Text("Eliminar"),
                  onPressed: (){
                    if(datos.promociones.contains(promo)){
                      datos.promociones.remove(promo);
                      eliminarBBDD(bd, promo.nombrePromo);
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
          content: new Text("Todos los campos editables son obligatorios, revíselos."),
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Aceptar"),
                  onPressed: (){
                    
                  }
                )
              ],
            )
          ],
        );
      }
    );
  }
  
    void insertarBBDD(BaseDatos db, Promocion promo) async{
    await db.initdb();
    db.insertPromociones(promo);
  }
  void modificarBBDD(BaseDatos db, String nombrePromo,Promocion promo) async{
    await db.initdb();
    db.updatePromo(nombrePromo, promo);
  }
    void eliminarBBDD(BaseDatos db, String nombrePromo) async{
    await db.initdb();
    db.deletePromociones(nombrePromo);
  }
    
}
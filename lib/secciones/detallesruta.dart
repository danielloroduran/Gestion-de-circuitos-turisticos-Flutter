import 'package:flutter/material.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';

class DetallesRuta extends StatefulWidget{

  Ruta ruta;
  DatosPrueba datos;

  DetallesRuta({Key key, this.datos, this.ruta}) : super(key: key);

  @override
  _DetallesRutaState createState() => _DetallesRutaState(ruta: ruta);

}

class _DetallesRutaState extends State<DetallesRuta> with SingleTickerProviderStateMixin{

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
  String foto;

  void initState(){

    super.initState();

    nombreController = new TextEditingController();
    estadoController = new TextEditingController();
    costeController = new TextEditingController();
    opinionesController = new TextEditingController();
    incidenciasController = new TextEditingController();
    sugerenciasController = new TextEditingController();
    localidadController = new TextEditingController();

    if(ruta != null){

      nombreController.text = ruta.nombre;
      estadoController.text = ruta.estado;
      costeController.text = ruta.coste.toString();
      opinionesController.text = ruta.opiniones;
      incidenciasController.text = ruta.incidencias;
      sugerenciasController.text = ruta.sugerencias;
      localidadController.text = ruta.localidad;
      foto = ruta.foto;
    }

    else{
      nombreController.text = "";
      estadoController.text = "";
      costeController.text = "";
      opinionesController.text = "";
      incidenciasController.text = "";
      sugerenciasController.text = "";
      localidadController.text = "";
      foto = "imagenes/rutagenerica.jpg";
      _editable = true;

    }

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
                  image: AssetImage(foto),
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
              )
            ],
          )
        ],
      ),
    );
  }

    Text _crearEstrellas(){
    String estrellas = '';
    
    if(ruta.puntuacion > 0){
      for(int i = 0; i < ruta.puntuacion; i++){
        estrellas += '⭐ ';
      }
      estrellas.trim();
      return Text(estrellas);
    }else{
      return Text('0');
    }

  }
}
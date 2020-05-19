import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/listareservas.dart';

class Inicio extends StatefulWidget{

  DatosPrueba datos;

  Inicio({Key key, @required this.datos}) : super(key: key);

  @override
  _InicioState createState() => _InicioState(datos: datos);

}

class _InicioState extends State<Inicio> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  _InicioState({@required this.datos});

  DateTime ahora = DateTime.now();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  child: new Text(
                    "Estadísticas de la aplicación",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    )
                  ),
                ),
                Container(
                  child: new Text(
                    "Última actualización: "+ahora.day.toString()+"/"+ahora.month.toString()+"/"+ahora.year.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    )
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 30,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.withOpacity(.26),
                      ),
                      child: Container(
                        child: new Icon(Icons.people, color: Colors.black38)
                      )
                    ),
                    SizedBox(height: 10),
                    Text(datos.turistasGeneral.length.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green),
                      ),
                      Text("usuarios",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF959595),
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent.withOpacity(.26),
                      ),
                      child: Container(
                        child: new Icon(Icons.directions_walk, color: Colors.black38)
                      )
                    ),
                    SizedBox(height: 10),
                    Text(datos.rutas.length.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orangeAccent),
                      ),
                      Text("rutas realizadas",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF959595),
                        ))
                  ],
                ),
              ],
            )
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text("Valoraciones medias",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 30,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(6),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange.withOpacity(.26),
                      ),
                      child: Container(
                        child: new Text("⭐")
                      )
                    ),
                    SizedBox(height: 10),
                    Text("3,5",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green),
                      ),
                      Text("en rutas",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF959595),
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(6),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent.withOpacity(.26),
                      ),
                      child: Container(
                        child: new Text("⭐")
                      )
                    ),
                    SizedBox(height: 10),
                    Text("4",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orangeAccent),
                      ),
                      Text("en guías",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF959595),
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(6),
                      height: 30,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueAccent.withOpacity(.26),
                      ),
                      child: Container(
                        child: new Text("Opiniones"),
                      )
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(6),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightGreen.withOpacity(.26),
                      ),
                      child: Container(
                        child: new Icon(Icons.arrow_upward, color: Colors.green)
                      ),
                    ),
                    Text("positivas",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF959595)),
                    )
                  ],
                ),
              ],
            )
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text("Uso de la aplicación",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: Colors.grey[300],
                  )
                ]
              ),
              child: new Image.asset("imagenes/mapa.png", fit: BoxFit.contain),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReservaRutas(datos: datos),)
          );
        },
        child: new Icon(Icons.history),
        tooltip: "Ir a historial y reservas",
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/detallesusuario.dart';
import 'package:practica_ipo2/secciones/pestanaguias.dart';
import 'package:practica_ipo2/secciones/pestanapromocion.dart';
import 'package:practica_ipo2/secciones/pestanagrupoturistas.dart';
import 'package:practica_ipo2/secciones/pestanagestionrutas.dart';
import 'package:practica_ipo2/secciones/ventanaAyuda.dart';
import 'package:practica_ipo2/modelos/usuario.dart';
import 'package:practica_ipo2/secciones/inicio.dart';


class Home extends StatefulWidget{
   DatosPrueba datos;
   Usuario usuario;
  Home({Key key, @required this.datos, @required this.usuario}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(datos: datos, usuario: usuario);
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  
  _HomeState({@required this.datos, @required this.usuario});

  Usuario usuario;
  DatosPrueba datos;
  TabController controlador;
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  bool enabled = true;
  String titulo = "Inicio";

  @override
  void initState(){
    super.initState();
    controlador = new TabController(
      length: 5,
      vsync: this,
    );
  }

  ListView construirDrawer(BuildContext context){
    return new ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text(usuario.nombreUsuario),
          accountEmail: new Text(usuario.correo),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new ExactAssetImage(usuario.foto),
            backgroundColor: Colors.white,
          ),
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage("imagenes/fondodrawer.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new ListTile(
          leading: new Icon(Icons.home),
          title: new Text("Inicio"),
          onTap: () {
            setState((){
              Navigator.pop(context);
              controlador.index = 0;
            });
          }
        ),
        new ListTile(
          leading: new Icon(Icons.person),
          title: new Text("Perfil"),
          onTap: () {
            setState(() {
              _esperarResultadoPerfil(context);
            });
          }
        ),
        new ListTile(
          leading: new Icon(Icons.settings),
          title: new Text("Configuración"),
          onTap: (){
            setState((){

            });
          }
        ),
        new ListTile(
          leading: new Icon(Icons.help),
          title: new Text("Ayuda"),
          onTap: (){
            setState((){
              Navigator.push(context, MaterialPageRoute(builder: (context) => VentanaAyuda(datos: datos)));
            });
          }
        ),
        new AboutListTile(
          child: new Text("Información de la app"),
          applicationIcon: new Icon(Icons.info),
          icon: new Icon(Icons.info),
          applicationName: "Gestión de circuitos",
          applicationVersion: "v1.0    04/06/2020",
          applicationLegalese: "Daniel, Sergio, Juan Antonio",
          
        ),
        new ListTile(
          leading: new Icon(Icons.close),
          title: new Text("Cerrar sesión"),
          onTap:() {
            setState(() {
              Navigator.pop(context);
              Navigator.pop(context);
            });
          }
        )
      ],

    );

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: new Text(titulo),
        backgroundColor: Colors.blueAccent,

      ),
      key: _drawerkey,
      bottomNavigationBar: Container(
        child: new TabBar(
          tabs: <Widget>[
            new Tab(
              icon: Icon(Icons.home),
            ),
            new Tab(
              icon: Icon(Icons.directions_walk),
            ),
            new Tab(
              icon: Icon(Icons.people),
            ),
            new Tab(
              icon: Icon(Icons.person),
            ),
            new Tab(
              icon: Icon(Icons.message),
            ),
          ],
          onTap: (indedx) {
            if(indedx == 0){
              setState((){
                titulo = "Inicio";
              });
            }else if (indedx == 1){
              setState((){
                titulo = "Gestión de rutas";
              });
            }else if(indedx == 2){
              setState((){
                titulo = "Turistas";
              });
            }else if(indedx == 3){
              setState((){
                titulo = "Guías";
              });
            }else if(indedx == 4){
              setState((){
                titulo = "Promociones";
              });
            }
          },
          controller: controlador,
        ),
        color: Colors.blueAccent,
      ),
      drawer: new Drawer(
        child: construirDrawer(context),
      ),
      body: new TabBarView(
        controller: controlador,
        children: <Widget>[new Inicio(datos: datos), new ListadoRutas(datos: datos), new ListadoGrupoTuristas(datos: datos), new ListadoGuias(datos: datos), new ListadoPromo(datos: datos)],
      ),
    );
  }

  void _esperarResultadoPerfil(context) async{

    final perfilActualizado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesUsuario(datos: datos, usuario: usuario),
      )
    );

  }
}
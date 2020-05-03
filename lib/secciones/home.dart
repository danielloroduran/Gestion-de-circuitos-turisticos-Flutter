import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/detallesusuario.dart';
import 'package:practica_ipo2/secciones/pestanarutas.dart';
import 'package:practica_ipo2/secciones/pestanaguias.dart';
import 'package:practica_ipo2/secciones/pestanapromocion.dart';
import 'package:practica_ipo2/secciones/pestanagrupoturistas.dart';
import 'package:practica_ipo2/secciones/pestanagestionrutas.dart';
import 'package:practica_ipo2/secciones/ventanaAyuda.dart';
import 'package:practica_ipo2/modelos/usuario.dart';


class Home extends StatefulWidget{
  final DatosPrueba datos;
  final Usuario usuario;
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
  String titulo = "Listado Rutas";

  @override
  void initState(){
    super.initState();
    controlador = new TabController(
      length: 5,
      vsync: this,
    );
  }

  ListTile _construirItem(
      BuildContext context, IconData iconData, String texto, String ruta) {
    return new ListTile(
        leading: new Icon(iconData),
        title: new Text(texto),
        onTap: () {
          setState(() {
            Navigator.pushNamed(context, ruta);
          });
        });
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
            child: new Text(usuario.nombreUsuario[0]),
          ),
        ),
        _construirItem(context, Icons.home, "Home", "/"),
//        _construirItem(context, Icons.person, "Perfil", "/detallesusuario"),
        new ListTile(
          leading: new Icon(Icons.person),
          title: new Text("Perfil"),
          onTap: () {
            setState(() {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesUsuario(datos: datos, usuario: usuario),
                )
              );
        //      Navigator.pop(context);
            });
          }
        ),
        _construirItem(context, Icons.settings, "Configuración", "/configuracion"),
        new ListTile(
          leading: new Icon(Icons.help),
          title: new Text("Ayuda"),
          onTap: (){
            setState((){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListadoAyuda()));
            });
          }
        ),
        new AboutListTile(
          child: new Text("Información de la app"),
          applicationIcon: new Icon(Icons.info),
          icon: new Icon(Icons.info),
          applicationName: "Gestión de circuitos",
          applicationVersion: "v1.0",
        ),
//        _construirItem(context, Icons.close, "Cerrar Sesión", "/login"),
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
              icon: Icon(Icons.build),
            ),
            new Tab(
              icon: Icon(Icons.person),
            ),
            new Tab(
              icon: Icon(Icons.people),
            ),
            new Tab(
              icon: Icon(Icons.message),
            ),
          ],
          onTap: (indedx) {
            if(indedx == 0){
              setState((){
                titulo = "Reservas";
              });
            }else if (indedx == 1){
              setState((){
                titulo = "Gestión de Rutas";
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
        children: <Widget>[new ReservaRutas(datos: datos), new ListadoRutas(datos: datos), new ListadoGrupoTuristas(datos: datos), new ListadoGuias(datos: datos), new ListadoPromo(datos: datos)],
      ),
    );
  }
}
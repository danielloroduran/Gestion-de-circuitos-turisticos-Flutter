import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/home.dart';
import 'package:practica_ipo2/modelos/usuario.dart';

class VentanaLogin extends StatefulWidget {
  static const nombreRuta = "/login";
  final DatosPrueba datos;
  VentanaLogin({Key key, @required this.datos}) : super(key: key);
  @override
  _VentanaLogin createState() => _VentanaLogin(datos: datos);
}

class _VentanaLogin extends State<VentanaLogin> {

  final DatosPrueba datos;
  _VentanaLogin({@required this.datos});

  TextEditingController usuarioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gestión de circuitos turísticos'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset('imagenes/logoinicio.png', height: 150, width: 150),
                ),
/*                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'TutorialKart',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )
                    ),*/
/*                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 40, bottom: 10),
                    child: Text(
                      'Inicio de sesión',
                      style: TextStyle(fontSize: 20),
                    )),*/
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                  child: TextField(
                    controller: usuarioController,
                    decoration: InputDecoration(
                      icon: new Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      icon: new Icon(Icons.vpn_key),
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('¿Olvidó la contraseña?'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Iniciar sesión'),
                      onPressed: () {
                        Usuario usuario;
                        bool puedeEntrar = false;

                        for(int i = 0; i < datos.usuarios.length; i++){
                          if(passwordController.text == datos.usuarios.elementAt(i).contrasena && datos.usuarios.elementAt(i).nombreUsuario == usuarioController.text){
                            puedeEntrar = true;
                            usuario = datos.usuarios.elementAt(i);
                          }
                        }

                        if(puedeEntrar){
                          DateTime ahora = DateTime.now();
                          String fecha = ahora.hour.toString()+":"+ahora.minute.toString()+", "+ahora.day.toString()+"/"+ahora.month.toString()+"/"+ahora.year.toString();
                          usuario.ultimaConexion = fecha;
                          _enviarDatos(context, usuario);
                        }
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('¿No tiene cuenta?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        '¡Regístrese!',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }

    void _enviarDatos(BuildContext context, Usuario usuario){
      usuarioController.text = "";
      passwordController.text = "";
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(datos: datos, usuario: usuario)));
    }
}

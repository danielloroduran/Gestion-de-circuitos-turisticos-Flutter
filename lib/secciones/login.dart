import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/secciones/home.dart';
import 'package:practica_ipo2/modelos/usuario.dart';

class VentanaLogin extends StatefulWidget {

  final DatosPrueba datos;
  VentanaLogin({Key key, @required this.datos}) : super(key: key);
  @override
  _VentanaLoginState createState() => _VentanaLoginState(datos: datos);
}

class _VentanaLoginState extends State<VentanaLogin> {

  final DatosPrueba datos;
  _VentanaLoginState({@required this.datos});

  TextEditingController usuarioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue[300],
                    Colors.blue[100],
                    Colors.white,
                  ],
                  stops: [0.1, 0.2, 0.9]
                )
              ),
            ),
            Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 19, top: 30, bottom: 30),
                  child: new Text(
                    "Gestión de rutas turísticas",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Image.asset('imagenes/logoinicio.png', height: 120, width: 120),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25, bottom: 10, left: 10, right: 10),
                  child: TextField(
                    controller: usuarioController,
                    decoration: InputDecoration(
                      icon: new Icon(Icons.person, color: Colors.black),
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
                      icon: new Icon(Icons.vpn_key, color: Colors.black),
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
                  padding: EdgeInsets.only(left: 135, top: 20, right: 20),
                  child: new Text("O inicie sesión con:",
                    style: TextStyle(
                      
                    )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                            image: DecorationImage(image: new AssetImage('imagenes/facebook.jpg')),
                          )
                        )
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                            image: DecorationImage(image: new AssetImage('imagenes/google.jpg')),
                          )
                        )
                      )
                    ],
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
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
            )
          )
          ],
        )
      )
    );
  }

    void _enviarDatos(BuildContext context, Usuario usuario){
      usuarioController.text = "";
      passwordController.text = "";
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(datos: datos, usuario: usuario)));
    }
}

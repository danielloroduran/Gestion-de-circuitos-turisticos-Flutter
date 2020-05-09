import 'package:flutter/material.dart';
import 'package:practica_ipo2/vista/itemreserva.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/ruta.dart';



class ReservaRutas extends StatefulWidget{

  DatosPrueba datos;
  ReservaRutas({Key key, @required this.datos}) : super(key: key);
  @override
  _ReservaRutasState createState() => _ReservaRutasState(datos: datos);
}

class _ReservaRutasState extends State<ReservaRutas> with SingleTickerProviderStateMixin{
  
  DatosPrueba datos;
  _ReservaRutasState({@required this.datos});
  List<Ruta> rutasMostrar;

  @override
  void initState(){
    super.initState();

    rutasMostrar = new List<Ruta>();

    for(int i = 0; i < datos.rutas.length; i++){
      if(datos.rutas.elementAt(i).estado == "Contratada" || datos.rutas.elementAt(i).estado == "Realizada"){
        rutasMostrar.add(datos.rutas.elementAt(i));
      }
    }

  }

  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: _construirLista(),
    );
  }

  Widget _construirLista(){
    return ListView.builder(
      itemCount: rutasMostrar.length,
      itemBuilder: (context, int index){
        return new Container(
          child: ItemReserva(rutasMostrar[index])
        );
      }
    );
  }
}



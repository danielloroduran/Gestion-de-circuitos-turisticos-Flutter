import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/secciones/detallespuntointeres.dart';

class ListadoPuntoInteresRuta extends StatefulWidget{

  DatosPrueba datos;
  Ruta ruta;

  ListadoPuntoInteresRuta({Key key, this.datos, this.ruta}) : super(key: key);

  @override
  _ListadoPuntoInteresRutaState createState() => _ListadoPuntoInteresRutaState(datos: datos, ruta: ruta);
}

class _ListadoPuntoInteresRutaState extends State<ListadoPuntoInteresRuta> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  Ruta ruta;

  _ListadoPuntoInteresRutaState({this.datos, this.ruta});
  Widget listapuntoInteres;

  void initState(){
    super.initState();

    if(ruta == null){
      ruta = new Ruta.enBlanco();
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Rutas asignadas"),
      ),
      body: ListView.builder(
          itemCount: ruta.puntoInteres.length,
          itemBuilder: (context, int index) {
            final item = ruta.puntoInteres[index];

            return Dismissible(
                key: Key(item.nombre),
                onDismissed: (direction) {
                  setState(() {
                    ruta.puntoInteres.removeAt(index);
                  });

                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(item.nombre + "eliminado para esta ruta")));
                },
                background: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20.0),
                  color: Colors.redAccent,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                  color: Colors.redAccent,
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: Card(
                    child: ListTile(
                      title: Text(ruta.puntoInteres[index].nombre,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.0)),
                      subtitle: Text("Horario: " + ruta.puntoInteres[index].horario,
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 16.0)),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(ruta.puntoInteres[index].foto),
                        radius: 25.0,
                      ),
                      contentPadding: EdgeInsets.all(20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )));
          }),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _mostrarDialogo();
        },
        tooltip: "Añadir nuevos puntos",
      ),
    );
  }
  void _esperarResultado(BuildContext context) async{

    final nuevopuntoInteres = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetallesPuntoInteres(datos: datos),
      )
    );

    setState(() {
      if(nuevopuntoInteres != null){
        ruta.puntoInteres.add(nuevopuntoInteres);
        datos.puntoInteres.add(nuevopuntoInteres);
      }
    });
  }

  void _mostrarDialogo(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Nuevo punto de interés"),
          content: new Text("¿Crear un nuevo punto (se añadirá de forma automática a esta ruta) o añadir uno existente?"),
          actions: <Widget>[
            new Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("Nuevo punto"),
                  onPressed: () {
                    _esperarResultado(context);
                  },
                ),
                new FlatButton(
                  child: new Text("Añadir existente"),
                  onPressed: () async{
                    final nuevosPuntos = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListadoPuntoInteres(datos: datos, puntoInteres: ruta.puntoInteres))
                    );
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
}

class ListadoPuntoInteres extends StatefulWidget{

  DatosPrueba datos;
  List<PuntoInteres> puntoInteres;

  ListadoPuntoInteres({Key key, this.datos, this.puntoInteres}) : super(key: key);

  @override
  _ListadoPuntoInteresState createState() => _ListadoPuntoInteresState(datos: datos, puntoInteres: puntoInteres);

}

class _ListadoPuntoInteresState extends State<ListadoPuntoInteres> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  List<PuntoInteres> puntoInteres;
  List<PuntoInteres> puntoInteresFinal;

  _ListadoPuntoInteresState({this.datos, this.puntoInteres});

  void initState(){
    super.initState();
    puntoInteresFinal = new List<PuntoInteres>();

    if(puntoInteres == null){
      puntoInteres = datos.puntoInteres;
    }else{
      for(int i = 0; i < puntoInteres.length; i++){
        puntoInteres[i].seleccionado = true;
      }
      for(int i = 0; i < datos.puntoInteres.length; i++){
        if(!puntoInteres.contains(datos.puntoInteres[i])){
          puntoInteres.add(datos.puntoInteres[i]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Text ("Puntos de interés"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Seleccionar todos", style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  for(int i = 0; i < puntoInteres.length; i++){
                    puntoInteres[i].seleccionado = true;
                  }
                });
              },
            )
          ],
        ),
        body: ListView (
          children: List.generate (puntoInteres.length, (index) {
            return new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: new ListTile (
              onTap: () {
                setState (() {
                  puntoInteres[index].seleccionado =! puntoInteres[index].seleccionado;
                });
              },
              selected: puntoInteres[index].seleccionado,
              leading: GestureDetector (
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container (
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric (vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(puntoInteres[index].foto),
                    radius: 25.0,
                  )
                ),
              ),
              title: Text (puntoInteres[index].nombre, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
              subtitle: Text("Horario: " + puntoInteres[index].horario, style: TextStyle(fontSize: 16.0, color: Colors.grey[500])),
              trailing: (puntoInteres[index].seleccionado)
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
              contentPadding: EdgeInsets.all(13),  
            )
            );

          }),
          
        ),
        
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            setState(() {
              for(int i = 0; i < puntoInteres.length; i++){
                if(puntoInteres[i].seleccionado){
                  puntoInteresFinal.add(puntoInteres[i]);
                  puntoInteres[i].seleccionado = false;
                }
              }
              Navigator.pop(context, puntoInteresFinal);
            });
          },
          tooltip: "Guardar",
        )
    );
  }
}



import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/datosprueba.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/modelos/ruta.dart';

class ListaRutasAsignadas extends StatefulWidget {
  DatosPrueba datos;
  Guia guia;

  ListaRutasAsignadas({Key key, this.datos, this.guia}) : super(key: key);

  _ListaRutasAsignadasState createState() => _ListaRutasAsignadasState(datos: datos, guia: guia);
}

class _ListaRutasAsignadasState extends State<ListaRutasAsignadas> with SingleTickerProviderStateMixin {
  DatosPrueba datos;
  Guia guia;

  _ListaRutasAsignadasState({this.datos, this.guia});

  void initState() {
    super.initState();

    if(guia == null){
      guia = new Guia.enBlanco();
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Rutas asignadas"),
      ),
      body: ListView.builder(
          itemCount: guia.rutasAsignadas.length,
          itemBuilder: (context, int index) {
            final item = guia.rutasAsignadas[index];

            return Dismissible(
                key: Key(item.nombre),
                onDismissed: (direction) {
                  setState(() {
                    guia.rutasAsignadas.removeAt(index);
                  });

                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(item.nombre + "eliminada para este guia")));
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
                      title: Text(guia.rutasAsignadas[index].nombre,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.0)),
                      subtitle: Text(guia.rutasAsignadas[index].localidad,
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 16.0)),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(guia.rutasAsignadas[index].foto),
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
          _esperarResultado(context);
        },
        tooltip: "Añadir nuevas rutas",
      ),
    );
  }

  void _esperarResultado(BuildContext context) async{

    final nuevasRutas = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListadoRutas(datos: datos, rutas: guia.rutasAsignadas))
    );

    setState(() {

      if(nuevasRutas != null){
        guia.rutasAsignadas = nuevasRutas;
        guia.rutasHistorial.addAll(nuevasRutas);
      }

    });

  }

}

class ListadoRutas extends StatefulWidget{

  DatosPrueba datos;
  List<Ruta> rutas;

  ListadoRutas({Key key, this.datos, this.rutas}) : super(key: key);

  @override
  _ListadoRutasState createState() => _ListadoRutasState(datos: datos, rutas: rutas);


}

class _ListadoRutasState extends State<ListadoRutas> with SingleTickerProviderStateMixin{

  DatosPrueba datos;
  List<Ruta> rutas;
  List<Ruta> rutasFinal;

  _ListadoRutasState({this.datos, this.rutas});

  void initState(){
    super.initState();
    rutasFinal = new List<Ruta>();

    if(rutas == null){
      rutas = datos.rutas;
    }else{
      for(int i = 0; i < rutas.length; i++){
        rutas[i].seleccionado = true;
      }
      for(int i = 0; i < datos.rutas.length; i++){
        if(!rutas.contains(datos.rutas[i])){
          rutas.add(datos.rutas[i]);
        }
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Text ("Rutas asignadas"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Seleccionar todos", style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  for(int i = 0; i < rutas.length; i++){
                    rutas[i].seleccionado = true;
                  }
                });
              },
            )
          ],
        ),
        body: ListView (
          children: List.generate (rutas.length, (index) {
            return new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: new ListTile (
              onTap: () {
                setState (() {
                  rutas[index].seleccionado =! rutas[index].seleccionado;
                });
              },
              selected: rutas[index].seleccionado,
              leading: GestureDetector (
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container (
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric (vertical: 4.0),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(rutas[index].foto),
                    radius: 25.0,
                  )
                ),
              ),
              title: Text (rutas[index].nombre, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
              subtitle: Text(rutas[index].localidad, style: TextStyle(fontSize: 16.0, color: Colors.grey[500])),
              trailing: (rutas[index].seleccionado)
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
              for(int i = 0; i < rutas.length; i++){
                if(rutas[i].seleccionado){
                  rutasFinal.add(rutas[i]);
                  rutas[i].seleccionado = false;
                }
              }
              Navigator.pop(context, rutasFinal);
            });
          },
          tooltip: "Guardar",
        )
    );
  }
}

class ListaRutasHistorial extends StatelessWidget{

  Guia _guia;

  ListaRutasHistorial(Guia guia){

    if(guia == null){
      _guia = new Guia.enBlanco();
    }else{
      this._guia = guia;
    }

  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Historial"),
      ),
      body: ListView.builder(
        itemCount: _guia.rutasHistorial.length,
        itemBuilder: (context, int index){
          return new Card(
            child: new ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(_guia.rutasHistorial[index].foto),
                radius: 25.0,
              ),
              title: Text(_guia.rutasHistorial[index].nombre, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black)),
              subtitle: Text(_guia.rutasHistorial[index].localidad, style: TextStyle(color: Colors.grey[500], fontSize: 16.0)),
              contentPadding: EdgeInsets.all(13),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )
          );
        },
      )
    );
  }

}

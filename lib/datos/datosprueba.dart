import 'package:flutter/material.dart';
import 'package:practica_ipo2/datos/baseDatos.dart';
import 'package:practica_ipo2/modelos/ayuda.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/modelos/usuario.dart';
import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';


class DatosPrueba{

  List<Usuario> usuarios;
  List<Guia> guias;
  List<PuntoInteres> puntoInteres;
  List<Turista> turistasGeneral;
  List<GrupoTurista> grupoTurista;
  List<Ruta> rutas;
  List<Promocion> promociones;
  List<Ayuda> ayuda;

  DatosPrueba(){
    cargarDatos();
  }

  void cargarDatos() async{
    BaseDatos db = BaseDatos();
    await db.initdb();
    
    usuarios = new List<Usuario>();
    usuarios = await db.getUsuarios();

    guias = new List<Guia>();
    guias = await db.getGuias();

    puntoInteres = new List<PuntoInteres>();
    puntoInteres = await db.getPuntosInteres();

    turistasGeneral = new List<Turista>();
    turistasGeneral = await db.getTuristas();

    promociones = new List<Promocion>();
    promociones = await db.getPromociones();
    
    rutas = new List<Ruta>();
    rutas = await db.getRutas();

    grupoTurista = new List<GrupoTurista>();
    grupoTurista = await db.getGrupoTuristas();

    for(int i = 0; i < grupoTurista.length; i++){
      grupoTurista.elementAt(i).turistas = await db.selectGT(grupoTurista.elementAt(i).nombreGrupo);
      grupoTurista.elementAt(i).setNumIntegrantes();
    }
 
    for(int i = 0; i < rutas.length; i++){
      rutas.elementAt(i).puntoInteres = await db.selectRutaPT(rutas.elementAt(i).nombre);
      rutas.elementAt(i).grupoTurista = await db.selectRutaGT(rutas.elementAt(i).nombre);
      rutas.elementAt(i).setTuristasTotal();
    }
    
    for(int i = 0; i < guias.length; i++){
      guias.elementAt(i).rutasAsignadas = await db.selectGuiaRutasAsignadas(guias.elementAt(i).dni);
      guias.elementAt(i).rutasHistorial = await db.selectGuiaRutasHistorial(guias.elementAt(i).dni);
    }
    
    ayuda = new List<Ayuda>();

    Ayuda ayuda1 = new Ayuda(Icons.home, "Inicio", "En esta pestaña se visualiza el historial y las reservas", "En esta pestaña el usuario podrá visualizar las estadísticas como el número de usuarios, número de rutas realizadas, la valoración media de las rutas, guías y opiniones, los lugares de España donde se utiliza la aplicación.");
    Ayuda ayuda2 = new Ayuda(Icons.directions_walk, "Gestión de rutas", "En esta pestaña se gestionan las rutas", "En esta pestaña el usuario podrá visualizar las rutas existentes, crear una nueva ruta, modificar y eliminar una ruta ya existente.");
    Ayuda ayuda3 = new Ayuda(Icons.people, "Turistas", "En esta pestaña se visualizan los turistas", "En esta pestaña el usuario podrá visualizar los turistas existentes, añadir un nuevo turista, modificar y eliminar un turista ya existente.");
    Ayuda ayuda4 = new Ayuda(Icons.person, "Guías", "En esta pestaña se visualizan los guías", "En esta pestaña el usuario podrá visualizar los guías existentes, añadir un nuevo guía, modificar y eliminar un guía ya existente.");
    Ayuda ayuda5 = new Ayuda(Icons.message, "Promociones", "En esta pestaña se visualizan las promociones", "En esta pestaña el usuario podrá visualizar las promociones existentes, crear una nueva promoción, modificar y eliminar una promoción ya existente.");

    ayuda.add(ayuda1);
    ayuda.add(ayuda2);
    ayuda.add(ayuda3);
    ayuda.add(ayuda4);
    ayuda.add(ayuda5);


  }

}
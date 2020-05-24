import 'package:flutter/material.dart';
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

  void cargarDatos(){

    usuarios = new List<Usuario>();

    Usuario usuario1 = new Usuario("usuario1", "usuario1", "imagenes/usuario1.jpg", "usuario1@correo.com", 611111111);
    Usuario usuario2 = new Usuario("admin", "admin", "imagenes/admin.png", "admin@correo.com", 622222222);

    usuarios.add(usuario1);
    usuarios.add(usuario2);

    guias = new List<Guia>();

    Guia guia1 = new Guia("Antonio", "Pérez", 666666666, "imagenes/cara1.jpg", 3, "Español", "Todos los días", 3, 20, "11111111-H", "antonio@correo.es");
    Guia guia2 = new Guia("Laura", "Moreno", 677777777, "imagenes/cara5.jpg", 5, "Español e Inglés", "Todos los días", 4, 30, "22222222-J", "laura@correo.es");

    guias.add(guia1);
    guias.add(guia2);

    puntoInteres = new List<PuntoInteres>();

    PuntoInteres pi1 = new PuntoInteres("Iglesia de Santa María", "Iglesia", "imagenes/iglesia.jpg", "Gratuita",  "Descripción de la iglesia", "Calle Nueva, 5", "Sábados, de 8:00 a 22:00", "30 minutos");
		PuntoInteres pi2 = new PuntoInteres("Estatua de piedra", "Estatua", "imagenes/estatua.jpg", "Gratuita", "Descripción de la estatua", "Calle Vieja, 7", "Sin horario", "5 minutos");
		PuntoInteres pi3 = new PuntoInteres("Museo de aviación", "Museo", "imagenes/museo.jpg", "2€/persona", "Descripción del museo", "Calle Doctora, 55", "Todos los días de 8:00 a 22:00", "2 horas");
		PuntoInteres pi4 = new PuntoInteres("Cuadro & arte", "Exposición", "imagenes/galeria.jpg", "Gratuita", "Descripción de la exposición", "Calle Licenciada", "Martes y Domingo, de 9:00 a 14:00", "3 horas");

    puntoInteres.add(pi1);
		puntoInteres.add(pi2);
		puntoInteres.add(pi3);
		puntoInteres.add(pi4);

    turistasGeneral = new List<Turista>();

    
		Turista turista1 = new Turista("Antonia", "Lopez",  655555555, "44444444-I", "antonia@correo.es", "imagenes/cara5.jpg", 23);
		Turista turista2 = new Turista("Ana", "Rosa", 666666666, "55555555-I", "rosa@correo.es", "imagenes/cara6.png", 50);
		Turista turista3 = new Turista("Pepe", "Lopez", 677777777, "66666666-K", "pepe@correo.es", "imagenes/cara1.jpg", 65);
		Turista turista4 = new Turista("Roberto", "Asín", 688888888, "77777777-L", "roberto@correo.es", "imagenes/personagenerica.png", 43);
		Turista turista5 = new Turista("Elena", "Jimenez",  699999999, "88888888-N", "elena@correo.es", "imagenes/personagenerica.png", 20);
		Turista turista6 = new Turista("Roberta", "Gonzalez", 699999991, "99999999-M", "roberta@correo.es", "imagenes/personagenerica.png", 72);
		Turista turista7 = new Turista("José", "Domingo", 611111112, "11111112-D", "jose@correo.es", "imagenes/personagenerica.png", 30);
		Turista turista8 = new Turista("Lolo", "Cañiz", 123456789, "12345678-H", "lolo@correo.es", "imagenes/personagenerica.png", 47);
		Turista turista9 = new Turista("Pepa", "Diez", 987654321, "12345678-Q", "pepa@correo.es", "imagenes/personagenerica.png", 32);
		Turista turista10 = new Turista("Angel", "Ortega", 623232323, "23232323-A", "angel@correo.es", "imagenes/cara1.jpg", 41);

    turistasGeneral.add(turista1);
		turistasGeneral.add(turista2);
		turistasGeneral.add(turista3);
		turistasGeneral.add(turista4);
		turistasGeneral.add(turista5);
		turistasGeneral.add(turista6);
		turistasGeneral.add(turista7);
		turistasGeneral.add(turista8);
		turistasGeneral.add(turista9);
		turistasGeneral.add(turista10);

    grupoTurista = new List<GrupoTurista>();

    GrupoTurista gt1 = new GrupoTurista("Grupo 1", "Estudiantes", "Descripción del grupo 1", "Intereses del grupo 1", "Restricciones del grupo 1", "imagenes/grupo.jpg");
		GrupoTurista gt2 = new GrupoTurista("Grupo 2", "Jubilados", "Descripción del grupo 2", "Intereses del grupo 2", "Restricciones del grupo 2", "imagenes/grupo.jpg");
    GrupoTurista gt3 = new GrupoTurista("Grupo 3", "Familiar", "Descripción del grupo 3", "Intereses del grupo 3", "Restricciones del grupo 3", "imagenes/grupo.jpg");

    gt1.turistas.add(turista1);
		gt1.turistas.add(turista2);
		gt1.turistas.add(turista3);
		
    gt2.turistas.add(turista4);
		gt2.turistas.add(turista5);
		gt2.turistas.add(turista6);

    gt3.turistas.add(turista7);
    gt3.turistas.add(turista8);
    gt3.turistas.add(turista9);
    gt3.turistas.add(turista10);

		gt1.setNumIntegrantes();
		gt2.setNumIntegrantes();
		grupoTurista.add(gt1);
		grupoTurista.add(gt2);

    promociones = new List<Promocion>();

    Promocion promo1 = new Promocion("Promocion 1", "Para nuestros clientes mas veteranos llega una oferta del 30% en la ruta de Miguelturra", 100, 30,"imagenes/miguelturra.jpg", "Miguelturra");
		Promocion promo2 = new Promocion("Promocion 2", "Para todos los turistas, esta semana se hará una oferta del 50% en el precio de la ruta de Ciudad Real", 50, 40,"imagenes/ciudadreal.jpg", "Ciudad Real");		
		
    promociones.add(promo1);
		promociones.add(promo2);

    rutas = new List<Ruta>();

    Ruta ruta1 = new Ruta("Ruta turística", "Contratada", 50, "Opiniones de ruta 1", "Sugerencias de ruta 1", "Ciudad Real", "10:00", "14:00", "imagenes/ciudadreal.jpg", "21/05/2020", 25554, 0);
		Ruta ruta2 = new Ruta("Ruta grastronómica", "Realizada", 100, "Opiniones de ruta 2", "Sugerencias de ruta 2", "Malagón", "9:00", "15:00", "imagenes/malagon.jpg", "20/05/2020", 34111, 4);
		Ruta ruta3 = new Ruta("Ruta cultural", "Nueva", 50, "Opiniones de ruta 3", "Sugerencias de ruta 3", "Miguelturra", "8:00", "12:00", "imagenes/miguelturra.jpg", "19/05/2020", null, 3);
		Ruta ruta4 = new Ruta("Ruta relajada", "Nueva", 100, "Opiniones de ruta 4", "Sugerencias de ruta 4", "Puertollano", "16:00", "20:00", "imagenes/puertollano.jpg", "18/05/2020", null, 2);
		Ruta ruta5 = new Ruta("Ruta cultural", "Nueva", 50, "Opiniones de ruta 5", "Sugerencias de ruta 5", "Fuente el Fresno", "15:00", "21:00", "imagenes/fuenteelfresno.jpg", "17/05/2020", null, 1);
		Ruta ruta6 = new Ruta("Ruta cultural", "Contratada", 100, "Opiniones de ruta 6", "Sugerencias de ruta 6", "Los Cortijos", "8:30", "12:30", "imagenes/loscortijos.jpg", "16/05/2020", 35412, 0);

    ruta1.grupoTurista.add(gt1);
    ruta1.setTuristasTotal();
    ruta1.puntoInteres.add(pi1);
    ruta1.puntoInteres.add(pi2);
    guia1.rutasAsignadas.add(ruta1);
    guia1.rutasAsignadas.add(ruta2);
    guia1.rutasHistorial.add(ruta3);

    ruta2.grupoTurista.add(gt2);
    ruta2.setTuristasTotal();
    ruta2.puntoInteres.add(pi3);
    ruta2.puntoInteres.add(pi4);
    guia2.rutasAsignadas.add(ruta3);
    guia2.rutasAsignadas.add(ruta4);
    guia2.rutasHistorial.add(ruta1);

    ruta6.grupoTurista.add(gt2);
    ruta6.setTuristasTotal();
    ruta6.puntoInteres.add(pi2);
    guia2.rutasAsignadas.add(ruta6);

    rutas.add(ruta1);
		rutas.add(ruta2);
		rutas.add(ruta3);
		rutas.add(ruta4);
		rutas.add(ruta5);
		rutas.add(ruta6);

    ayuda = new List<Ayuda>();

    Ayuda ayuda1 = new Ayuda(Icons.home, "Historial y reservas", "En esta pestaña se visualiza el historial y las reservas", "En esta pestaña el usuario podrá visualizar las estadísticas como el número de usuarios, número de rutas realizadas, la valoración media de las rutas, guías y opiniones, los lugares de España donde se utiliza la aplicación.");
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
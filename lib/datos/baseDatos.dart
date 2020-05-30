import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/modelos/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class BaseDatos {

  Usuario usuario1 = new Usuario("usuario1", "usuario1", "imagenes/usuario1.jpg", "usuario1@correo.com", 611111111);
  Usuario usuario2 = new Usuario("admin", "admin", "imagenes/admin.png", "admin@correo.com", 622222222);
  Guia guia1 = new Guia("11111111-H","Antonio", "Pérez", 666666666, "imagenes/cara1.jpg", 3, "Español", "Todos los días", 3, 20,  "antonio@correo.es");
  Guia guia2 = new Guia("22222222-J","Laura", "Moreno", 677777777, "imagenes/cara5.jpg", 5, "Español e Inglés", "Todos los días", 4, 30,  "laura@correo.es");
  PuntoInteres pi1 = new PuntoInteres("Iglesia de Santa María", "Iglesia", "imagenes/iglesia.jpg", "Gratuita",  "Iglesia de estilo Barroco", "Calle Nueva, 5", "Sábados, de 8:00 a 22:00", "30 minutos");
	PuntoInteres pi2 = new PuntoInteres("Estatua de piedra", "Estatua", "imagenes/estatua.jpg", "Gratuita", "Estatua creada en el siglo XV con gran importancia cultural en la zona", "Calle Vieja, 7", "Sin horario", "5 minutos");
	PuntoInteres pi3 = new PuntoInteres("Museo de aviación", "Museo", "imagenes/museo.jpg", "2€/persona", "Museo que se centra en la aviación española a lo largo de la historia", "Calle Doctora, 55", "Todos los días de 8:00 a 22:00", "2 horas");
	PuntoInteres pi4 = new PuntoInteres("Cuadro & arte", "Exposición", "imagenes/galeria.jpg", "Gratuita", "Exposición de arte del pintor español Eduardo Arroyo", "Calle Licenciada", "Martes y Domingo, de 9:00 a 14:00", "3 horas");
  Turista turista1 = new Turista("44444444-I","Antonia", "Lopez",  655555555,  "antonia@correo.es", "imagenes/cara5.jpg", 23);
	Turista turista2 = new Turista("55555555-I","Ana", "Rosa", 666666666,  "rosa@correo.es", "imagenes/cara6.png", 50);
	Turista turista3 = new Turista("66666666-K","Pepe", "Lopez", 677777777,  "pepe@correo.es", "imagenes/cara1.jpg", 65);
	Turista turista4 = new Turista("77777777-L","Roberto", "Asín", 688888888,  "roberto@correo.es", "imagenes/personagenerica.png", 43);
	Turista turista5 = new Turista("88888888-N","Elena", "Jimenez",  699999999,  "elena@correo.es", "imagenes/personagenerica.png", 20);
	Turista turista6 = new Turista("99999999-M","Roberta", "Gonzalez", 699999991,  "roberta@correo.es", "imagenes/personagenerica.png", 72);
	Turista turista7 = new Turista("11111112-D","José", "Domingo", 611111112,  "jose@correo.es", "imagenes/personagenerica.png", 30);
	Turista turista8 = new Turista("12345678-H","Lolo", "Cañiz", 123456789,  "lolo@correo.es", "imagenes/personagenerica.png", 47);
	Turista turista9 = new Turista("12345678-Q","Pepa", "Diez", 987654321,  "pepa@correo.es", "imagenes/personagenerica.png", 32);
	Turista turista10 = new Turista("23232323-A","Angel", "Ortega", 623232323,  "angel@correo.es", "imagenes/cara1.jpg", 41);  
  GrupoTurista gt1 = new GrupoTurista("Grupo 1", "Estudiantes", "Grupo de jovenes estudiantes en viaje de fin de curso", "Buscan aventura en la naturaleza", "Alguna persona es menor de edad", "imagenes/grupo.jpg");
	GrupoTurista gt2 = new GrupoTurista("Grupo 2", "Jubilados", "Grupo de personas mayores", "Les gusta las actuaciones en vivo", "Hace falta silla de ruedas para 2 personas", "imagenes/grupo.jpg");
  GrupoTurista gt3 = new GrupoTurista("Grupo 3", "Familiar", "Familia del pueblo de Daimiel", "Quieren conocer distintos pueblos de la provincia", "Necesario coche grande para las sillas de los niños", "imagenes/grupo.jpg");
  Ruta ruta1 = new Ruta("Ruta turística", "Contratada", 50, "Muy interesantes, pero es muy larga y cansada", "Para personas que les guste conocer mundo", "Ciudad Real", "10:00", "14:00", "imagenes/ciudadreal.jpg", "21/05/2020", 25554, 0);
	Ruta ruta2 = new Ruta("Ruta grastronómica", "Realizada", 100, "Buena ruta si lo que quieres es conocer los restaurantes del lugar", "Para todos aquellos que quieran conocer la gastronomia de la zona", "Malagón", "9:00", "15:00", "imagenes/malagon.jpg", "20/05/2020", 34111, 4);
	Ruta ruta3 = new Ruta("Ruta cultural", "Nueva", 50, "Enseña todas las historias culturales del pueblo, la recomiendo", "Se explican todos los acontecimientos culturales de la historia", "Miguelturra", "8:00", "12:00", "imagenes/miguelturra.jpg", "19/05/2020", null, 3);
	Ruta ruta4 = new Ruta("Ruta relajada", "Nueva", 100, "Muy util para personas estresadas de la ciudad", "Para aquellas personas que quiren tomarse un respiro", "Puertollano", "16:00", "20:00", "imagenes/puertollano.jpg", "18/05/2020", null, 2);
	Ruta ruta5 = new Ruta("Ruta ecológica", "Nueva", 50, "Ruta demasiado corta, aunque interesante", "Ruta para los que quieran descubrir monumentos", "Fuente el Fresno", "15:00", "21:00", "imagenes/fuenteelfresno.jpg", "17/05/2020", null, 1);
	Ruta ruta6 = new Ruta("Ruta de museos", "Contratada", 100, "Buena ruta por los museos de la zona", "Ruta pensada para los amantes de las obras de arte", "Los Cortijos", "8:30", "12:30", "imagenes/loscortijos.jpg", "16/05/2020", 35412, 0);
  Promocion promo1 = new Promocion("Promocion 1", "Para nuestros clientes mas veteranos llega una oferta del 30% en la ruta de Miguelturra", 100, 30,"imagenes/miguelturra.jpg", "Miguelturra");
	Promocion promo2 = new Promocion("Promocion 2", "Para todos los turistas, esta semana se hará una oferta del 50% en el precio de la ruta de Ciudad Real", 50, 40,"imagenes/ciudadreal.jpg", "Ciudad Real");
  Database _db;
  Future initdb() async{
    _db = await openDatabase('BBDDPracticaIPO2.db',
    version:1,
    onCreate: (Database db, int version) async{
      db.execute("CREATE TABLE Usuarios (usuario TEXT PRIMARY KEY, contraseña TEXT, foto TEXT, correo TEXT, telefono INTEGER, ultimaConexion TEXT)");
      db.execute("CREATE TABLE Guias (DNI TEXT PRIMARY KEY, nombre TEXT, apellidos TEXT, movil INTEGER, foto TEXT, puntuacion INTEGER, idiomas TEXT, disponibilidad TEXT, precioHora REAL, precioDia REAL, correo TEXT)");
      db.execute("CREATE TABLE PuntosInteres (nombre TEXT PRIMARY KEY, tipo TEXT, foto TEXT, entrada TEXT, descripcion TEXT, direccion TEXT, horario TEXT, duracionVisita TEXT)");
      db.execute("CREATE TABLE Turistas (DNI TEXT PRIMARY KEY, nombre TEXT, apellidos TEXT, movil INTEGER, correo TEXT, foto TEXT, edad INTEGER)");
      db.execute("CREATE TABLE GrupoTuristas (nombreGrupo TEXT PRIMARY KEY, tipo TEXT, descripcion TEXT, intereses TEXT, restricciones TEXT, foto TEXT)");
      db.execute("CREATE TABLE Promociones (nombrePromo TEXT PRIMARY KEY, mensaje TEXT, precio REAL, descuento INTEGER, foto TEXT, localidad TEXT)");
      db.execute("CREATE TABLE Rutas (nombre TEXT PRIMARY KEY, estado TEXT, coste REAL, opiniones TEXT, sugerencias TEXT, localidad TEXT, horaInicio TEXT, horaFin TEXT, foto TEXT, fecha TEXT, reserva INTEGER, puntuacion INTEGER)"); 
      db.execute("CREATE TABLE GuiaRutas (guia TEXT, rutasAsignadas TEXT, rutasHistorial TEXT , PRIMARY KEY (guia, rutasAsignadas,rutasHistorial))");
      db.execute("CREATE TABLE GTTuristas (grupoTurista TEXT, turista TEXT, PRIMARY KEY (grupoTurista, turista))");
      db.execute("CREATE TABLE RutaPT (ruta TEXT, puntosInteres TEXT, PRIMARY KEY (ruta, puntosInteres))");
      db.execute("CREATE TABLE RutaGT (ruta TEXT, grupoTurista TEXT, PRIMARY KEY (ruta, grupoTurista))");
      db.insert('Guias', guia1.toMap());db.insert('Guias', guia2.toMap());
      db.insert('Usuarios', usuario1.toMap());db.insert('Usuarios', usuario2.toMap());
      db.insert('PuntosInteres', pi1.toMap());db.insert('PuntosInteres', pi3.toMap());
      db.insert('PuntosInteres', pi2.toMap());db.insert('PuntosInteres', pi4.toMap());
      db.insert('Turistas', turista1.toMap());db.insert('Turistas', turista6.toMap());
      db.insert('Turistas', turista2.toMap());db.insert('Turistas', turista7.toMap());
      db.insert('Turistas', turista3.toMap());db.insert('Turistas', turista8.toMap());
      db.insert('Turistas', turista4.toMap());db.insert('Turistas', turista9.toMap());
      db.insert('Turistas', turista5.toMap());db.insert('Turistas', turista10.toMap());
      db.insert('GrupoTuristas', gt1.toMap());
      db.insert('GrupoTuristas', gt2.toMap());
      db.insert('GrupoTuristas', gt3.toMap());
      db.insert('Rutas', ruta1.toMap());db.insert('Rutas', ruta4.toMap());
      db.insert('Rutas', ruta2.toMap());db.insert('Rutas', ruta5.toMap());
      db.insert('Rutas', ruta3.toMap());db.insert('Rutas', ruta6.toMap());
      db.insert('Promociones', promo1.toMap());db.insert('Promociones', promo2.toMap());
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt1.nombreGrupo + "', '" + turista1.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt1.nombreGrupo + "', '" + turista2.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt1.nombreGrupo + "', '" + turista3.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt2.nombreGrupo + "', '" + turista4.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt2.nombreGrupo + "', '" + turista5.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt2.nombreGrupo + "', '" + turista6.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt3.nombreGrupo + "', '" + turista7.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt3.nombreGrupo + "', '" + turista8.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt3.nombreGrupo + "', '" + turista9.dni + "')");
      db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt3.nombreGrupo + "', '" + turista10.dni + "')");
      db.rawInsert("INSERT INTO RutaGT VALUES ('" + ruta1.nombre + "', '" + gt1.nombreGrupo + "')");
      db.rawInsert("INSERT INTO RutaGT VALUES ('" + ruta2.nombre + "', '" + gt2.nombreGrupo + "')");
      db.rawInsert("INSERT INTO RutaGT VALUES ('" + ruta6.nombre + "', '" + gt3.nombreGrupo + "')");
      db.rawInsert("INSERT INTO RutaPT VALUES ('" + ruta1.nombre + "', '" + pi1.nombre + "')");
      db.rawInsert("INSERT INTO RutaPT VALUES ('" + ruta1.nombre + "', '" + pi2.nombre + "')");
      db.rawInsert("INSERT INTO RutaPT VALUES ('" + ruta2.nombre + "', '" + pi3.nombre + "')");
      db.rawInsert("INSERT INTO RutaPT VALUES ('" + ruta2.nombre + "', '" + pi4.nombre + "')");
      db.rawInsert("INSERT INTO RutaPT VALUES ('" + ruta6.nombre + "', '" + pi2.nombre + "')");
      db.rawInsert("INSERT INTO GuiaRutas VALUES ('" + guia1.nombre + "', '" + ruta1.nombre + "', '" + ruta3.nombre + "')");
      db.rawInsert("INSERT INTO GuiaRutas VALUES ('" + guia1.nombre + "', '" + ruta2.nombre + "', '" + ruta3.nombre + "')");
      db.rawInsert("INSERT INTO GuiaRutas VALUES ('" + guia2.nombre + "', '" + ruta3.nombre + "', '" + ruta1.nombre + "')");
      db.rawInsert("INSERT INTO GuiaRutas VALUES ('" + guia2.nombre + "', '" + ruta4.nombre + "', '" + ruta1.nombre + "')");
      db.rawInsert("INSERT INTO GuiaRutas VALUES ('" + guia2.nombre + "', '" + ruta6.nombre + "', '" + ruta1.nombre + "')");


    });
  } 

  insertGuiaRutas(String guia, String rutaAsignada, String rutaHistorial ){
     _db.rawInsert("INSERT INTO GuiaRutas VALUES ('" + guia + "', '" + rutaAsignada + "', '" + rutaHistorial + "')");
  }
  selectGuiaRutasHistorial(String guia) async {
    List<Map<String, dynamic>> rutasHistorial = await _db.rawQuery("SELECT * FROM Rutas WHERE nombre IN (SELECT rutasHistorial FROM GuiaRutas WHERE guia = '"+ guia +"')");
    return List.generate(rutasHistorial.length, (i){
     return Ruta(
        rutasHistorial[i]['nombre'].toString(),
        rutasHistorial[i]['estado'].toString(),
        rutasHistorial[i]['coste'],
        rutasHistorial[i]['opiniones'].toString(),
        rutasHistorial[i]['sugerencias'].toString(),
        rutasHistorial[i]['localidad'].toString(),
        rutasHistorial[i]['horaInicio'].toString(),
        rutasHistorial[i]['horaFin'].toString(),
        rutasHistorial[i]['foto'].toString(),
        rutasHistorial[i]['fecha'].toString(),
        rutasHistorial[i]['reserva'],
        rutasHistorial[i]['puntuacion']
        
    );
    });
  }

  selectGuiaRutasAsignadas(String guia) async {
    List<Map<String, dynamic>> rutasAsignadas = await _db.rawQuery("SELECT * FROM Rutas WHERE nombre IN (SELECT rutasAsignadas FROM GuiaRutas WHERE guia = '"+ guia +"')");
    return List.generate(rutasAsignadas.length, (i){
     return Ruta(
        rutasAsignadas[i]['nombre'].toString(),
        rutasAsignadas[i]['estado'].toString(),
        rutasAsignadas[i]['coste'],
        rutasAsignadas[i]['opiniones'].toString(),
        rutasAsignadas[i]['sugerencias'].toString(),
        rutasAsignadas[i]['localidad'].toString(),
        rutasAsignadas[i]['horaInicio'].toString(),
        rutasAsignadas[i]['horaFin'].toString(),
        rutasAsignadas[i]['foto'].toString(),
        rutasAsignadas[i]['fecha'].toString(),
        rutasAsignadas[i]['reserva'],
        rutasAsignadas[i]['puntuacion']
        
    );
    });
  }
  insertRutaPT(String ruta, String puntoInteres){
    _db.rawInsert("INSERT INTO RutaPT VALUES ('" + ruta + "', '" + puntoInteres + "')");
  }
  updateRutaPT(String nombrePunto, Ruta ruta, String viejoPunto) {
    _db.rawUpdate("UPDATE RutaPT SET puntosInteres '"+nombrePunto+"' WHERE ruta = '"+ruta.nombre+"' AND puntosInteres = '"+viejoPunto+"'");
   }
  deleteRutaPT(String nombrePunto, String ruta) {
    _db.rawDelete("DELETE FROM RutaPT WHERE puntosInteres = '"+ nombrePunto +"' AND ruta = '"+ruta+"' ");
  }
  insertRutaGT(String ruta, String grupo){
    _db.rawInsert("INSERT INTO RutaGT VALUES ('" + ruta + "', '" + grupo + "')");
  }
  updateRutaGT(String nuevoGrupo, Ruta ruta, String viejoGrupo) {
    _db.rawUpdate("UPDATE RutaGT SET grupoTurista '"+nuevoGrupo+"' WHERE ruta = '"+ruta.nombre+"' AND grupoTurista = '"+viejoGrupo+"'");
   }
   deleteRutaGT(String nombreGrupo, String ruta) {
    _db.rawDelete("DELETE FROM RutaGT WHERE grupoTurista = '"+ nombreGrupo +"' AND ruta = '"+ruta+"' ");
  }
  selectRutaPT(String ruta) async {
    List<Map<String, dynamic>> puntoInteres = await _db.rawQuery("SELECT * FROM PuntosInteres WHERE nombre IN (SELECT puntosInteres FROM RutaPT WHERE ruta = '"+ ruta +"')");
    return List.generate(puntoInteres.length, (i){
     return PuntoInteres(
        puntoInteres[i]['nombre'].toString(),
        puntoInteres[i]['tipo'].toString(),
        puntoInteres[i]['foto'].toString(),
        puntoInteres[i]['entrada'].toString(),
        puntoInteres[i]['descripcion'].toString(),
        puntoInteres[i]['direccion'].toString(),
        puntoInteres[i]['horario'].toString(),
        puntoInteres[i]['duracionVisita'].toString()
        
    );
    });
  }
  selectRutaGT(String ruta) async {
    List<Map<String, dynamic>> grupoTuristas = await _db.rawQuery("SELECT * FROM GrupoTuristas WHERE nombreGrupo IN (SELECT grupoTurista FROM RutaGT WHERE ruta = '"+ ruta +"')");
    return List.generate(grupoTuristas.length, (i){
     return GrupoTurista(
        grupoTuristas[i]['nombreGrupo'].toString(),
        grupoTuristas[i]['tipo'].toString(),
        grupoTuristas[i]['descripcion'].toString(),
        grupoTuristas[i]['intereses'].toString(),
        grupoTuristas[i]['restricciones'].toString(),
        grupoTuristas[i]['foto'].toString()
        
    );
    });
  }

  insertGTTuristas(String gt, String turista){
    _db.rawInsert("INSERT INTO GTTuristas VALUES ('" + gt + "', '" + turista + "')");
  }
  updateGTTuristas(String grupoTurista, Turista turista) {
    _db.rawUpdate("UPDATE GTTuristas SET grupoTurista '"+grupoTurista+"' WHERE turista = '"+turista.dni+"'");
  }
  deleteGTTuristas(String dni, String nombreGrupo) {
    _db.rawDelete("DELETE FROM GTTuristas WHERE turista = '"+ dni +"' AND grupoTurista = '"+nombreGrupo+"' ");
  }
  selectGT(String grupo) async {
    List<Map<String, dynamic>> turistas = await _db.rawQuery("SELECT * FROM Turistas WHERE DNI IN (SELECT turista FROM GTTuristas WHERE grupoTurista = '"+ grupo +"')");
    return List.generate(turistas.length, (i){
     return Turista(
        turistas[i]['DNI'].toString(),
        turistas[i]['nombre'].toString(),
        turistas[i]['apellidos'].toString(),
        turistas[i]['movil'],
        turistas[i]['correo'].toString(),
        turistas[i]['foto'].toString(),
        turistas[i]['edad']
        
    );
    });
  }
  insertGuias(Guia guia) {
    _db.insert('Guias', guia.toMap());
  }
  deleteGuias(String dni){
    _db.delete('Guias', where: 'DNI = ?', whereArgs: [dni]);
  }
  updateGuias(String dni, Guia guia){
    _db.update('Guias', guia.toMap(), where: 'DNI = ?', whereArgs: [dni]);
  }
  Future<List<Guia>> getGuias() async{
    List<Map<String, dynamic>> guias = await _db.query('Guias');
    return List.generate(guias.length, (i){
      return Guia(
        guias[i]['DNI'].toString(),
        guias[i]['nombre'].toString(),
        guias[i]['apellidos'].toString(),
        guias[i]['movil'],
        guias[i]['foto'].toString(),
        guias[i]['puntuacion'],
        guias[i]['idiomas'].toString(),
        guias[i]['disponibilidad'].toString(),
        guias[i]['precioHora'],
        guias[i]['precioDia'],
        guias[i]['correo'].toString(),
        );
      
    });
  }
  insertPuntosInteres(PuntoInteres pt) {
    _db.insert('PuntosInteres', pt.toMap());

  }
  updatePuntoInteres(String nombrePunto, PuntoInteres puntoInteres) {
    _db.update('PuntosInteres', puntoInteres.toMap(), where: 'nombre = ?', whereArgs: [nombrePunto]);
  }
  deletePuntosInteres(String pt){
    _db.delete('PuntosInteres', where: 'nombre = ?', whereArgs: [pt]);
  }
  Future<List<PuntoInteres>> getPuntosInteres() async{
    List<Map<String, dynamic>> puntoInteres = await _db.query('PuntosInteres');
    return List.generate(puntoInteres.length, (i){
      return PuntoInteres(
        puntoInteres[i]['nombre'].toString(),
        puntoInteres[i]['tipo'].toString(),
        puntoInteres[i]['foto'].toString(),
        puntoInteres[i]['entrada'].toString(),
        puntoInteres[i]['descripcion'].toString(),
        puntoInteres[i]['direccion'].toString(),
        puntoInteres[i]['horario'].toString(),
        puntoInteres[i]['duracionVisita'].toString()
        );
      
    });
  }
  insertTuristas(Turista turista) {
    _db.insert('Turistas', turista.toMap());

  }
  deleteTuristas(String dni){
    _db.delete('Turistas', where: 'DNI = ?', whereArgs: [dni]);
  }
  updateTuristas(String dni, Turista turista) {
    _db.update('Turistas', turista.toMap(), where: 'DNI = ?', whereArgs: [dni]);
  }
  Future<List<Turista>> getTuristas() async{
    List<Map<String, dynamic>> turistas = await _db.query('Turistas');
    return List.generate(turistas.length, (i){
      return Turista(
        turistas[i]['DNI'].toString(),
        turistas[i]['nombre'].toString(),
        turistas[i]['apellidos'].toString(),
        turistas[i]['movil'],
        turistas[i]['correo'].toString(),
        turistas[i]['foto'].toString(),
        turistas[i]['edad']
        );
      
    });
  }
  insertGrupoTuristas(GrupoTurista gp) {
    _db.insert('GrupoTuristas', gp.toMap());

  }
  updateGruposTuristas(String nombreGrupoViejo, GrupoTurista grupo) {
    _db.update('GrupoTuristas', grupo.toMap(), where: 'nombreGrupo = ?', whereArgs: [nombreGrupoViejo]);
  }
  deleteGrupoTuristas(String nombreGrupo){
    _db.delete('GrupoTuristas', where: 'nombreGrupo = ?', whereArgs: [nombreGrupo]);
  }
  Future<List<GrupoTurista>> getGrupoTuristas() async{
    List<Map<String, dynamic>> grupoTuristas = await _db.query('GrupoTuristas');
    return List.generate(grupoTuristas.length, (i){
      return GrupoTurista(
        grupoTuristas[i]['nombreGrupo'].toString(),
        grupoTuristas[i]['tipo'].toString(),
        grupoTuristas[i]['descripcion'].toString(),
        grupoTuristas[i]['intereses'].toString(),
        grupoTuristas[i]['restricciones'].toString(),
        grupoTuristas[i]['foto'].toString()
        );
      
    });
  }
  insertPromociones(Promocion promocion) {
    _db.insert('Promociones', promocion.toMap());
  }
  deletePromociones(String promo){
    _db.delete('Promociones', where: 'nombrePromo = ?', whereArgs: [promo]);
  }
  updatePromo(String nombrePromo, Promocion promo) {
    _db.update('Promociones', promo.toMap(), where: 'nombrePromo = ?', whereArgs: [nombrePromo]);
  }
  Future<List<Promocion>> getPromociones() async{
    List<Map<String, dynamic>> promos = await _db.query('Promociones');
    return List.generate(promos.length, (i){
      return Promocion(
        promos[i]['nombrePromo'].toString(),
        promos[i]['mensaje'].toString(),
        promos[i]['precio'],
        promos[i]['descuento'],
        promos[i]['foto'].toString(),
        promos[i]['localidad'].toString()
        );
      
    });
  }
  insertRutas(Ruta ruta) {
    _db.insert('Rutas', ruta.toMap());
  }
  updateRutas(String nombreRuta, Ruta ruta) {
    _db.update('Rutas', ruta.toMap(), where: 'nombre = ?', whereArgs: [nombreRuta]);
  }
  deleteRutas(String ruta){
    _db.delete('Rutas', where: 'nombre = ?', whereArgs: [ruta]);
  }
  Future<List<Ruta>> getRutas() async{
    List<Map<String, dynamic>> rutas = await _db.query('Rutas');
    return List.generate(rutas.length, (i){
      return Ruta(
        rutas[i]['nombre'].toString(),
        rutas[i]['estado'].toString(),
        rutas[i]['coste'],
        rutas[i]['opiniones'].toString(),
        rutas[i]['sugerencias'].toString(),
        rutas[i]['localidad'].toString(),
        rutas[i]['horaInicio'].toString(),
        rutas[i]['horaFin'].toString(),
        rutas[i]['foto'].toString(),
        rutas[i]['fecha'].toString(),
        rutas[i]['reserva'],
        rutas[i]['puntuacion']
        );
      
    });
  }
  insertUsuario(Usuario usuario) {
    _db.insert('Usuarios', usuario.toMap());

  }
  updateUsuario(String usuarioViejo, Usuario usuario) {
    _db.update('Usuarios', usuario.toMap(), where: 'usuario = ?', whereArgs: [usuarioViejo]);
  }
  deleteUsuario(String nombreUsuario){
    _db.delete('Usuarios', where: 'usuario = ?', whereArgs: [nombreUsuario]);
  }
  
  Future<List<Usuario>> getUsuarios() async{
    List<Map<String, dynamic>> usuarios = await _db.query('Usuarios');
    return List.generate(usuarios.length, (i){
      return Usuario(
        usuarios[i]['usuario'].toString(),
        usuarios[i]['contraseña'].toString(),
        usuarios[i]['foto'].toString(),
        usuarios[i]['correo'].toString(),
        usuarios[i]['telefono'],
        );
      
    });
  }
  
}
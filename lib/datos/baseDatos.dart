import 'package:practica_ipo2/modelos/grupoturista.dart';
import 'package:practica_ipo2/modelos/guia.dart';
import 'package:practica_ipo2/modelos/promocion.dart';
import 'package:practica_ipo2/modelos/puntointeres.dart';
import 'package:practica_ipo2/modelos/ruta.dart';
import 'package:practica_ipo2/modelos/turista.dart';
import 'package:practica_ipo2/modelos/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class baseDatos {
  Database _db;
  Future initdb() async{
    _db = await openDatabase('baseDatos.db',
    version:1,
    onCreate: (Database db, int version){
      db.execute("CREATE TABLE Usuarios (usuario TEXT PRIMARY KEY, contraseña TEXT, foto TEXT, correo TEXT, telefono INTEGER, ultimaConexion TEXT)");
      db.execute("CREATE TABLE Guias (DNI TEXT PRIMARY KEY, nombre TEXT, apellidos TEXT, movil INTEGER, foto TEXT, puntuacion INTEGER, idiomas TEXT, disponibilidad TEXT, precioHora REAL, precioDia REAL, correo TEXT)");
      db.execute("CREATE TABLE PuntosInteres (nombre TEXT PRIMARY KEY, tipo TEXT, foto TEXT, entrada TEXT, descripcion TEXT, direccion TEXT, horario TEXT, duracionVisita TEXT)");
      db.execute("CREATE TABLE Turistas (DNI TEXT PRIMARY KEY, nombre TEXT, apellidos TEXT, movil INTEGER, correo TEXT, foto TEXT, edad INTEGER)");
      db.execute("CREATE TABLE GrupoTuristas (nombreGrupo TEXT PRIMARY KEY, tipo TEXT, descripcion TEXT, intereses TEXT, restricciones TEXT, foto TEXT)");
      db.execute("CREATE TABLE Promociones (nombrePromo TEXT PRIMARY KEY, mensaje TEXT, precio REAL, descuento INTEGER, foto TEXT, localidad TEXT)");
      db.execute("CREATE TABLE Rutas (nombre TEXT PRIMARY KEY, estado TEXT, coste REAL, opiniones TEXT, sugerencias TEXT, localidad TEXT, horaInicio TEXT, horaFin TEXT, foto TEXT, fecha TEXT, reserva INTEGER, puntuacion INTEGER)"); 
    });
  } 
  
  insertGuias(Guia guia) {
    _db.insert('Guias', guia.toMap());

  }
  deleteGuias(String dni){
    _db.delete('Guias', where: 'DNI = ?', whereArgs: [dni]);
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
  insertPromociones(Promocion promocion) {
    _db.insert('Promociones', promocion.toMap());

  }
  deletePromociones(String promo){
    _db.delete('Promociones', where: 'nombrePromo = ?', whereArgs: [promo]);
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
  insertUsuario(Usuario usuario) {
    _db.insert('Usuarios', usuario.toMap());

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
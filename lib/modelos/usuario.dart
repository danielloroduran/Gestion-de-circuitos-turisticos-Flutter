
class Usuario{

  String _nombreUsuario;
  String _contrasena;
  String _foto;
  String _ultimaConexion;
  String _correo;
  int _telefono;

  Usuario(String nombreUsuario, String contrasena, String foto, String correo, int telefono, {String ultimaConexion = ""}){
    this._nombreUsuario = nombreUsuario;
    this._contrasena = contrasena;
    this._foto = foto;
    this._correo = correo;
    this._telefono = telefono;
  }
  
  Map<String, dynamic> toMap(){
    return {
      'usuario': _nombreUsuario,
      'contraseña': _contrasena,
      'foto': _foto,
      'correo': _correo,
      'telefono': _telefono,
      'ultimaConexion': _ultimaConexion,
    };
  }

  String get nombreUsuario => _nombreUsuario;
  String get contrasena => _contrasena;
  String get foto => _foto;
  String get ultimaConexion => _ultimaConexion;
  String get correo => _correo;
  int get telefono => _telefono;

  set nombreUsuario(String nombreUsuario) => _nombreUsuario =  nombreUsuario;
  set contrasena(String contrasena) => _contrasena = contrasena;
  set foto(String foto) => _foto = foto;
  set ultimaConexion(String ultimaConexion) => _ultimaConexion = ultimaConexion;
  set correo(String correo) => _correo = correo;
  set telefono(int telefono) => _telefono = telefono;

}
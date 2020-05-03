class Promocion{

  String _nombrePromo;
  String _mensaje;
  int _precio;

  Promocion(String nombrePromo, String mensaje, int precio){
    this._nombrePromo = nombrePromo;
    this._mensaje = mensaje;
    this._precio = precio;
  }

  String get nombrePromo => _nombrePromo;
  String get mensaje => _mensaje;
  int get precio => _precio;

  set nombrePromo(String nombrePromo) => _nombrePromo = nombrePromo;
  set mensaje(String mensaje) => _mensaje = mensaje;
  set precio(int precio) => _precio = precio;

}
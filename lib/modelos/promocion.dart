class Promocion{

  String _nombrePromo;
  String _mensaje;
  int _precio;
  String _descuento;

  Promocion(String nombrePromo, String mensaje, int precio, String descuento){
    this._nombrePromo = nombrePromo;
    this._mensaje = mensaje;
    this._precio = precio;
    this._descuento = descuento;
  }

  String get nombrePromo => _nombrePromo;
  String get mensaje => _mensaje;
  int get precio => _precio;
  String get descuento => _descuento;

  set nombrePromo(String nombrePromo) => _nombrePromo = nombrePromo;
  set mensaje(String mensaje) => _mensaje = mensaje;
  set precio(int precio) => _precio = precio;
  set descuento(String descuento) => _descuento = descuento;

}
class Promocion{

  String _nombrePromo;
  String _mensaje;
  double _precio;
  int _descuento;
  double _precioFinal;
  String _foto;
  String _localidad;
  Promocion(String nombrePromo, String mensaje, double precio, int descuento, String foto, String localidad){
    this._nombrePromo = nombrePromo;
    this._mensaje = mensaje;
    this._precio = precio;
    this._descuento = descuento;
    this._precioFinal = precio-((descuento/100)*precio);
    this._foto = foto;
    this._localidad = localidad;

  }

  String get nombrePromo => _nombrePromo;
  String get mensaje => _mensaje;
  double get precio => _precio;
  int get descuento => _descuento;
  double get precioFinal =>_precioFinal;
  String get foto => _foto;
  String get localidad => _localidad;

  set nombrePromo(String nombrePromo) => _nombrePromo = nombrePromo;
  set mensaje(String mensaje) => _mensaje = mensaje;
  set precio(double precio) => _precio = precio;
  set descuento(int descuento) => _descuento = descuento;
  set foto(String foto) => _foto = foto;
  set localidad(String localidad) => _localidad = localidad;

  void setPrecioFinal(){
    this._precioFinal = precio-((descuento/100)*precio);
  }

}
import 'dart:math'; //importa la biblioteca para usar la clase point

class Rectangulo {
  Point origin;
  int width;
  int height;

  //constructor
  Rectangulo ({this.origin = const Point (0,0), this.width = 0, this.height=0});

  //metodo tostring
  @override
  String toString() => 'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';

  }
  void main() {
    //crea e imprime una instancia instancia de rectangulo 
  print(Rectangulo(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangulo(origin: const Point(10, 10)));
  print(Rectangulo(width: 200));
  print(Rectangulo()); //creaun rectangulo con todos los valores predeterminado

}
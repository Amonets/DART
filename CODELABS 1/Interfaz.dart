import 'dart:math';

abstract class Shape {
  num get area; // Propiedad abstracta que será implementada por las subclases.
}
class Circle implements Shape {
  final num radius; // Propiedad final que almacena el radio del círculo.
  // Constructor que inicializa el radio.
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}
class Square implements Shape {
  final num side;
// Constructor que inicializa el lado.
  Square(this.side);
  num get area => pow(side, 2);
  }
  class CircleMock implements Circle {
  num area; // Propiedad area necesaria para implementar Circle.
    num radius;
    // Constructor opcional para inicializar las propiedades si es necesario.
  CircleMock({this.area = 0, this.radius = 0});
}
void main() {
  final circle = Circle(2); // Crea una instancia de Circle con radio 2.
  final square = Square(2); // Crea una instancia de Square con lado 2.
  print(circle.area); // Imprime el área del círculo.
  print(square.area); // Imprime el área del cuadrado.

  final mock = CircleMock(area: 0, radius: 2); // Crea una instancia de CircleMock.
  print(mock.area); // Imprime el área del mock (0 en este caso).
  print(mock.radius); // Imprime el radio del mock (2 en este caso).
}
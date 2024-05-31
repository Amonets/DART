import 'dart:math';//esta biblioteca es una d las principales de Daart

//Opción 2: crear un constructor de fábrica
abstract class Shape 
{
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}
class Circle implements Shape {
  final num radius;// Propiedad final que almacena el radio del círculo.
  Circle(this.radius); // Constructor que inicializa el radio.
  num get area => pi * pow(radius, 2); // Implementación de la propiedad area para calcular el área del círculo.
}

class Square implements Shape {
  final num side;// Propiedad final que almacena el lado del cuadrado.
  Square(this.side);// Constructor que inicializa el lado.
  num get area => pow(side, 2);// Implementación de la propiedad area para calcular el área del cuadrado. 
}
void main() {
  final circle = Shape('circle');// Crea un círculo usando el constructor de fábrica.
  final square = Shape('square');// Crea un cuadrado usando el constructor de fábrica.
  print(circle.area);// Imprime el área del círculo.
  print(square.area);// Imprime el área del cuadrado.
}
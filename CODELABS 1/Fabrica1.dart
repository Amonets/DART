import 'dart:math';//esta biblioteca es una d las principales de Dart que proporcionan funciones matematicas

//define una clase abstracta shape con una propiedad abstracta area
abstract class Shape {
  num get area;
}
//circle implementa shape y tiene una propiedad de radius un constructor. implementa la propiedad area para calcular el area
class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
  
}

//Opción 1: crear una función de nivel superior
//la función shapeFactory toma un tipo type y devuelve una instancia de circle o square
//Si el tipo no es reconocido, lanza una excepción.
Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);
  throw 'Can\'t create $type.';
}

//main crea instancias de Circle y Square usando shapeFactory y luego imprime sus áreas.
void main() {
  final circle = shapeFactory('circle');
  final square = shapeFactory('square');
  print(circle.area);
  print(square.area);
}
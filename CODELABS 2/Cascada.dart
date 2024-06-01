void main() {
  // Variables
  var name = 'Alice';
  final age = 30;
  const pi = 3.14;

  print('Nombre: $name, Edad: $age, Pi: $pi');

  // Funciones
  int add(int a, int b) {
    return a + b;
  }

  var sum = add(3, 4);
  print('Sum: $sum');

  // Crear instancia de Person y llamar a su método greet
  var person = Person('Bob', 40);
  person.greet();

  // Colecciones
  var fruits = ['Manzana', 'banano', 'naranga'];
  fruits.add('uva');
  print('Frutas: $fruits');

  var scores = {'matematica': 90, 'Ciencia': 85};
  scores['historias'] = 88;
  print('Scores: $scores');

  // Control de flujo
  var number = 5;
  if (number > 0) {
    print('Positivo');
  } else if (number < 0) {
    print('Negative');
  } else {
    print('Zero');
  }

  for (var i = 0; i < 5; i++) {
    print(i);
  }

  // Excepciones
  try {
    var result = 10 ~/ 0;
    print('Resultado: $result');
  } catch (e) {
    print('Caught an exception: $e');
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void greet() {
    print('Hola, mi nombre es $name y tengo $age años.');
  }
}

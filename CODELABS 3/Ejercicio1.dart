// Función para verificar si al menos un usuario tiene 17 años o menos.
bool anyUserUnder18(Iterable<User> users) {
  // Utiliza el método `any` para comprobar si algún usuario cumple la condición de tener 17 años o menos.
  return users.any((user) => user.age <= 17);
}

// Función para verificar si todos los usuarios tienen 14 años o más.
bool everyUserOver13(Iterable<User> users) {
  // Utiliza el método `every` para comprobar si todos los usuarios cumplen la condición de tener 14 años o más.
  return users.every((user) => user.age >= 14);
}

// Definición de la clase `User` con propiedades `name` y `age`.
class User {
  final String name;
  final int age;

  // Constructor de la clase `User`.
  User(this.name, this.age);
}

// El siguiente código se utiliza para proporcionar retroalimentación sobre tu solución.
// No es necesario leer o modificarlo.
void main() {
  // Lista de usuarios para probar las funciones, con datos modificados.
  final users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
    User('David', 14),
    User('Eve', 13),  // Nuevo usuario de 13 años.
    User('Frank', 15), // Nuevo usuario de 15 años.
  ];

  try {
    // Prueba la función anyUserUnder18 con la lista de usuarios.
    final out = anyUserUnder18(users);
    // Si la función no encuentra ningún usuario menor de 18 años, imprime un mensaje de error.
    if (!out) {
      print('Parece que `anyUserUnder18` está incorrecto. ¡Sigue intentando!');
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función no está implementada.
    print(
      'Intenté ejecutar `anyUserUnder18`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Captura cualquier excepción que ocurra durante la ejecución de la función.
    print('Intenté ejecutar `anyUserUnder18`, pero recibí una excepción: $e');
    return;
  }

  try {
    // Con solo un usuario mayor de 18, debería ser falso
    final out = anyUserUnder18([User('Alice', 21)]);
    // Si la función devuelve true, imprime un mensaje de error.
    if (out) {
      print(
        'Parece que `anyUserUnder18` está incorrecto. ¿Qué pasa si todos los usuarios tienen más de 18 años?',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función no está implementada.
    print(
      'Intenté ejecutar `anyUserUnder18`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Captura cualquier excepción que ocurra durante la ejecución de la función.
    print(
      'Intenté ejecutar `anyUserUnder18([User("Alice", 21)])`, '
      'pero recibí una excepción: $e',
    );
    return;
  }

  try {
    // Prueba la función `everyUserOver13` con la lista de usuarios.
    final out = everyUserOver13(users);
    // Si la función encuentra algún usuario menor de 14 años, imprime un mensaje de error.
    if (!out) {
      print(
        'Parece que `everyUserOver13` está incorrecto. '
        '¡No hay usuarios menores de 13 años!',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función no está implementada.
    print(
      'Intenté ejecutar `everyUserOver13`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Captura cualquier excepción que ocurra durante la ejecución de la función.
    print(
      'Intenté ejecutar `everyUserOver13`, '
      'pero recibí una excepción: $e',
    );
    return;
  }

  try {
    // Prueba la función `everyUserOver13` con una lista que contiene un usuario menor de 13 años.
    final out = everyUserOver13([User('Dan', 12)]);
    // Si la función devuelve true, imprime un mensaje de error.
    if (out) {
      print(
        'Parece que `everyUserOver13` está incorrecto. '
        '¡Hay al menos un usuario menor de 13 años!',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función no está implementada.
    print(
      'Intenté ejecutar `everyUserOver13`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Captura cualquier excepción que ocurra durante la ejecución de la función.
    print(
      'Intenté ejecutar `everyUserOver13([User(\'Dan\', 12)])`, '
      'pero recibí una excepción: $e',
    );
    return;
  }

  // Si todas las pruebas pasan, imprime un mensaje de éxito.
  print('Éxito. ¡Todas las pruebas pasaron!');
}

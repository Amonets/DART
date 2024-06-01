//any y each
//Ejercicio: Verificar que un Iterable cumpla una condición
// Función para verificar si al menos un usuario tiene menos de 18 años
bool anyUserUnder18(Iterable<User> users) {
  return users.any((user) => user.age < 18);
}

// Función para verificar si todos los usuarios tienen más de 13 años
bool everyUserOver13(Iterable<User> users) {
  return users.every((user) => user.age > 13);
}

// Definición de la clase User, que representa a un usuario con nombre y edad
class User {
  final String name;
  final int age;

  User(
    this.name,
    this.age,
  );
}

// El siguiente código se utiliza para proporcionar retroalimentación sobre tu solución.
// No es necesario leer o modificarlo.
void main() {
  // Lista de usuarios de ejemplo
  final users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
    User('David', 14),
  ];

  try {
    // Verificar si al menos un usuario tiene menos de 18 años
    final out = anyUserUnder18(users);
    if (!out) {
      print('Parece que `anyUserUnder18` es incorrecta. ¡Sigue intentando!');
      return;
    }
  } on UnimplementedError {
    // Manejar el caso en que la función no está implementada
    print(
      'Intenté ejecutar `anyUserUnder18`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Manejar cualquier otra excepción que pueda ocurrir
    print('Intenté ejecutar `anyUserUnder18`, pero recibí una excepción: $e');
    return;
  }

  try {
    // Verificar con un caso especial: solo un usuario mayor de 18 años, debería ser falso
    final out = anyUserUnder18([User('Alice', 21)]);
    if (out) {
      print(
          'Parece que `anyUserUnder18` es incorrecta. ¿Qué pasa si todos los usuarios tienen más de 18 años?');
      return;
    }
  } on UnimplementedError {
    // Manejar el caso en que la función no está implementada
    print(
      'Intenté ejecutar `anyUserUnder18`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Manejar cualquier otra excepción que pueda ocurrir
    print(
      'Intenté ejecutar `anyUserUnder18([User("Alice", 21)])`, '
      'pero recibí una excepción: $e',
    );
    return;
  }

  try {
    // Verificar si todos los usuarios tienen más de 13 años
    final out = everyUserOver13(users);
    if (!out) {
      print(
        'Parece que `everyUserOver13` es incorrecta. '
        '¡No hay usuarios menores de 14 años!',
      );
      return;
    }
  } on UnimplementedError {
    // Manejar el caso en que la función no está implementada
    print(
      'Intenté ejecutar `everyUserOver13`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Manejar cualquier otra excepción que pueda ocurrir
    print(
      'Intenté ejecutar `everyUserOver13`, '
      'pero recibí una excepción: $e',
    );
    return;
  }

  try {
    // Verificar con un caso especial: solo un usuario menor de 14 años, debería ser falso
    final out = everyUserOver13([User('Dan', 12)]);
    if (out) {
      print(
        'Parece que `everyUserOver13` es incorrecta. '
        '¡Hay al menos un usuario menor de 14 años!',
      );
      return;
    }
  } on UnimplementedError {
    // Manejar el caso en que la función no está implementada
    print(
      'Intenté ejecutar `everyUserOver13`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Manejar cualquier otra excepción que pueda ocurrir
    print(
      'Intenté ejecutar `everyUserOver13([User(\'Dan\', 12)])`, '
      'pero recibí una excepción: $e',
    );
    return;
  }

  // Si se superan todas las pruebas, se imprime un mensaje de éxito
  print('Éxito. Todas las pruebas pasaron!');
}

// Función para filtrar usuarios menores de 21 años
Iterable<User> filterOutUnder21(Iterable<User> users) {
  // Filtrar usuarios cuya edad sea mayor o igual a 21
  return users.where((user) => user.age >= 21);
}

// Función para encontrar usuarios con nombres cortos (de longitud 3 o menos)
Iterable<User> findShortNamed(Iterable<User> users) {
  // Filtrar usuarios cuyo nombre tenga una longitud de 3 caracteres o menos
  return users.where((user) => user.name.length <= 3);
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
    User('Dan', 12),
  ];

  try {
    // Verificar si el filtrado de usuarios menores de 21 años es correcto
    final out = filterOutUnder21(users);
    if (out.any((user) => user.age < 21) || out.length != 2) {
      print(
        'Parece que `filterOutUnder21` es incorrecta, hay '
        'exactamente dos usuarios con edad menor a 21. ¡Sigue intentando!',
      );
      return;
    }
  } on UnimplementedError {
    // Manejar el caso en que la función no está implementada
    print(
      'Intenté ejecutar `filterOutUnder21`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Manejar cualquier otra excepción que pueda ocurrir
    print(
      'Intenté ejecutar `filterOutUnder21`, '
      'pero recibí una excepción: ${e.runtimeType}',
    );
    return;
  }

  try {
    // Verificar si el filtrado de usuarios con nombres cortos es correcto
    final out = findShortNamed(users);
    if (out.any((user) => user.name.length > 3) || out.length != 2) {
      print(
        'Parece que `findShortNamed` es incorrecta, hay '
        'exactamente dos usuarios con un nombre de tres letras. ¡Sigue intentando!',
      );
      return;
    }
  } on UnimplementedError {
    // Manejar el caso en que la función no está implementada
    print(
      'Intenté ejecutar `findShortNamed`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Manejar cualquier otra excepción que pueda ocurrir
    print(
      'Intenté ejecutar `findShortNamed`, '
      'pero recibí una excepción: ${e.runtimeType}',
    );
    return;
  }

  // Si se superan todas las pruebas, se imprime un mensaje de éxito
  print('¡Éxito! ¡Todas las pruebas pasaron!');
}

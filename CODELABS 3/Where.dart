// WHERE
/*  Utilizo where() para el cumplimiento de dos funciones:

    Parte 1: Implementar filterOutUnder21().
        Devuelve un Iterable que contenga a todos los usuarios de 21 años o más.
    Parte 2: Implementar findShortNamed().
        Devuelve un Iterable conteniendo a todos los usuarios con nombres de longitud 3 o menos.
*/

Iterable<User> filterOutUnder21(Iterable<User> users) {
  // Implementa la función filterOutUnder21.
  return users.where((user) => user.age >= 21); // Filtra los usuarios con 21 años o más
}

Iterable<User> findShortNamed(Iterable<User> users) {
  // Implementa la función findShortNamed.
  return users.where((user) => user.name.length <= 3); // Filtra los usuarios con nombres de longitud 3 o menos
}

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
  // Lista de usuarios para probar las funciones
  final users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
    User('Dan', 12),
  ];

  try {
    // Prueba la función filterOutUnder21 con la lista de usuarios
    final out = filterOutUnder21(users);
    // Verifica si hay usuarios menores de 21 años o si la cantidad de usuarios filtrados no es correcta
    if (out.any((user) => user.age < 21) || out.length != 2) {
      print(
        'Parece que `filterOutUnder21` está incorrecta, hay '
        'exactamente dos usuarios menores de 21 años. ¡Sigue intentando!',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función no está implementada
    print(
      'Intenté ejecutar `filterOutUnder21`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción que ocurra durante la ejecución de la función
    print(
      'Intenté ejecutar `filterOutUnder21`, '
      'pero recibí una excepción: ${e.runtimeType}',
    );
    return;
  }

  try {
    // Prueba la función findShortNamed con la lista de usuarios
    final out = findShortNamed(users);
    // Verifica si hay usuarios con nombres de longitud mayor a 3 o si la cantidad de usuarios filtrados no es correcta
    if (out.any((user) => user.name.length > 3) || out.length != 2) {
      print(
        'Parece que `findShortNamed` está incorrecta, hay '
        'exactamente dos usuarios con un nombre de tres letras. ¡Sigue intentando!',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función no está implementada
    print(
      'Intenté ejecutar `findShortNamed`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción que ocurra durante la ejecución de la función
    print(
      'Intenté ejecutar `findShortNamed`, '
      'pero recibí una excepción: ${e.runtimeType}',
    );
    return;
  }

  // Si todas las pruebas pasan, imprime un mensaje de éxito
  print('Éxito. ¡Todas las pruebas pasaron!');
}

// Función para obtener los nombres y edades de los usuarios
Iterable<String> getNameAndAges(Iterable<User> users) {
  // Utiliza la función map para convertir cada usuario en una cadena que contiene su nombre y edad
  return users.map((user) => '${user.name} is ${user.age}');
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
  ];

  try {
    // Obtener los nombres y edades de los usuarios y convertirlos en una lista
    final out = getNameAndAges(users).toList();
    // Verificar si la lista generada es igual a la lista esperada
    if (!_listEquals(out, ['Alice is 21', 'Bob is 17', 'Claire is 52'])) {
      print(
        'Parece que `getNameAndAges` está incorrecta. ¡Sigue intentando! '
        'El resultado fue: $out',
      );
      return;
    }
  } on UnimplementedError {
    // Manejar el caso en que la función no está implementada
    print(
      'Intentaste ejecutar `getNameAndAges`, pero recibiste un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Manejar cualquier otra excepción que pueda ocurrir
    print('Intentaste ejecutar la función, pero recibiste una excepción: $e');
    return;
  }

  // Si todas las pruebas pasan, imprimir un mensaje de éxito
  print('¡Éxito! Todas las pruebas pasaron.');
}

// Función de utilidad para verificar la igualdad de dos listas
bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (var index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) return false;
  }
  return true;
}

/* En este ejercicio, tu código toma un Iterable de User y tienes que devolver un Iterable que contiene cadenas 
que contienen el nombre y la edad de cada usuario.

Cada cadena en el Iterable debe seguir este formato: name is age, por ejemplo, 'Alice is 21'.
*/

Iterable<String> getNameAndAges(Iterable<User> users) {
  // Implementa la función getNameAndAges.
  return users.map((user) => '${user.name} tiene ${user.age} años'); // Uso de interpolación para concatenar los elementos
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
// No es necesario leerlo o modificarlo.
void main() {
  // Lista de usuarios para probar la función
  final users = [
    User('Ana', 30),    // Cambié los nombres y edades para nuevos usuarios
    User('Juan', 25),
    User('Luisa', 40),
  ];

  try {
    // Convierte el resultado de la función a una lista
    final out = getNameAndAges(users).toList();
    // Verifica si el resultado es el esperado
    if (!_listEquals(out, ['Ana tiene 30 años', 'Juan tiene 25 años', 'Luisa tiene 40 años'])) {
      print(
        'Parece que `getNameAndAges` está incorrecto. ¡Sigue intentando! '
        'El resultado fue: $out',
      );
      return;
    }
    print(out);  // Imprime el resultado
  } on UnimplementedError {
    // Captura el error si la función no está implementada
    print(
      'Intenté ejecutar `getNameAndAges`, pero recibí un error. '
      '¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción que ocurra durante la ejecución de la función
    print('Intenté ejecutar la función, pero recibí una excepción: $e');
    return;
  }

  // Si todas las pruebas pasan, imprime un mensaje de éxito
  print('Éxito. ¡Todas las pruebas pasaron!');
}

// Función auxiliar para comparar listas
bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (var index = 0; index < a.length; index += 1) {
    if (a[index] != b[index]) return false;
  }
  return true;
}

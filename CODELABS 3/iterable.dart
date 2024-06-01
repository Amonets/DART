// Implementa el predicado de singleWhere
// con las siguientes condiciones:
// * El elemento contiene el carácter 'a'
// * El elemento empieza con el carácter 'M'
String singleWhere(Iterable<String> items) {
  return items.singleWhere(
    // Condición: el elemento empieza con 'M' y contiene 'a'
    (e) => e.startsWith('M') && e.contains('a'),
    // Si no se encuentra ningún elemento que cumpla la condición, devuelve 'None!'
    orElse: () => 'None!',
  );
}

// El siguiente código se utiliza para proporcionar retroalimentación 
// No es necesario leer o modificarlo.
void main() {
  // Lista de elementos para probar la función, con datos modificados
  const items = [
    'Salad',
    'Popcorn',
    'Milk',
    'Toast',
    'Sugar',
    'Mandarin',  // Nuevo elemento que cumple la condición
    'Tomato',
    'Egg',
    'Water',
  ];

  try {
    // Llama a la función singleWhere con la lista de elementos
    final str = singleWhere(items);
    // Verifica si el resultado es 'Mandarin'
    if (str == 'Mandarin') {
      print('Éxito. ¡Todas las pruebas pasaron!');
      // Imprime el elemento que cumple la condición
      print('$str');
    } else {
      print(
        'Intenté llamar a singleWhere, pero recibí $str en lugar de '
        'el valor esperado \'Mandarin\'',
      );
    }
  } on StateError catch (stateError) {
    // Captura el error si hay 0 o muchos elementos que cumplen la condición
    print(
      'Intenté llamar a singleWhere, pero recibí un StateError: ${stateError.message}. '
      'singleWhere fallará si 0 o muchos elementos cumplen el predicado.',
    );
  } on UnimplementedError {
    // Captura el error si la función no está implementada
    print(
      'Intenté ejecutar `singleWhere`, pero recibí un error. '
      '¿Implementaste la función?',
    );
  } catch (e) {
    // Captura cualquier otra excepción que ocurra durante la ejecución de la función
    print('Intenté llamar a singleWhere, pero recibí una excepción: $e');
  }
}

// Implementa la función singleWhere con el siguiente predicado:
// * El elemento comienza con el carácter 'M'
// * El elemento contiene el carácter 'a'
String singleWhere(Iterable<String> items) {
  // Utiliza singleWhere para encontrar un único elemento que cumpla con las condiciones especificadas
  return items.singleWhere(
          (element) => element.startsWith('M') && element.contains('a'));
}

// El siguiente código se utiliza para proporcionar retroalimentación sobre tu solución.
// No es necesario leer o modificarlo.
void main() {
  // Lista de elementos de prueba
  const items = [
    'Salad',
    'Popcorn',
    'Milk',
    'Toast',
    'Sugar',
    'Mozzarella',
    'Tomato',
    'Egg',
    'Water',
  ];

  try {
    // Llama a singleWhere con la lista de elementos
    final str = singleWhere(items);
    // Comprueba si el resultado es el esperado
    if (str == 'Mozzarella') {
      print('Éxito. ¡Todas las pruebas pasaron!');
    } else {
      print(
        'Intenté llamar a singleWhere, pero recibí $str en lugar de '
        'el valor esperado \'Mozzarella\'',
      );
    }
  } on StateError catch (stateError) {
    // Captura el error si no se encuentra exactamente un elemento que coincida con el predicado
    print(
      'Intenté llamar a singleWhere, pero recibí un StateError: ${stateError.message}. '
      'singleWhere fallará si 0 o más elementos coinciden con el predicado.',
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

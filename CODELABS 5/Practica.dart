// TODO: Implementar la función changeUsername aquí.
Future<String> changeUsername() async {
  try {
    // Llama a fetchNewUsername para obtener el nuevo nombre de usuario.
    return await fetchNewUsername();
  } catch (err) {
    // Si fetchNewUsername lanza una excepción, captura el error y devuelve un mensaje de error.
    return err.toString();
  }
}

// La siguiente función se proporciona para simular
// una operación asíncrona que podría tardar un tiempo y
// potencialmente lanzar una excepción.
Future<String> fetchNewUsername() =>
    Future.delayed(const Duration(milliseconds: 500), () => throw UserError());

// Clase de error personalizada para representar un error de nombre de usuario no válido.
class UserError implements Exception {
  @override
  String toString() => 'El nuevo nombre de usuario es inválido';
}

// El siguiente código se utiliza para probar y proporcionar retroalimentación sobre la solución.
// No es necesario leerlo ni modificarlo.

void main() async {
  final List<String> messages = [];
  const typoMessage = 'Prueba fallida! Verifique si hay errores tipográficos en el valor de retorno';

  print('Probando...');
  try {
    messages
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncDidCatchException(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                '¿Recordaste llamar a fetchNewUsername dentro de un bloque try/catch?',
          }))
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncErrorEquals(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                '¿Recordaste llamar a fetchNewUsername dentro de un bloque try/catch?',
          }))
      ..removeWhere((m) => m.contains(_passed))
      ..toList();

    if (messages.isEmpty) {
      print('Éxito. ¡Todas las pruebas pasaron!');
    } else {
      messages.forEach(print);
    }
  } catch (e) {
    print('Intentó ejecutar la solución, pero recibió una excepción: $e');
  }
}

// Funciones de prueba.

// Comprueba si la excepción de usuario se maneja correctamente.
Future<String> _asyncErrorEquals(Function fn) async {
  final result = await fn();
  if (result == UserError().toString()) {
    return _passed;
  } else {
    return 'Prueba fallida! ¿Has convertido a cadena y devuelto el error capturado?';
  }
}

// Comprueba si la excepción se captura correctamente.
Future<String> _asyncDidCatchException(Function fn) async {
  var caught = true;
  try {
    await fn();
  } on UserError catch (_) {
    caught = false;
  }

  if (caught == false) {
    return _noCatch;
  } else {
    return _passed;
  }
}

const _passed = 'PASSED';
const _noCatch = 'NO_CATCH';

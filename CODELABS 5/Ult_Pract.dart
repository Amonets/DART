//Ejercicio: Poniéndolo todo junto
// Parte 1
String addHello(String user) => 'Hello $user';

// Parte 2
// Llama a la función asíncrona proporcionada fetchUsername()
// para devolver el nombre de usuario.
Future<String> greetUser() async {
  final username = await fetchUsername();
  return addHello(username);
}

// Parte 3
// Llama a la función asíncrona proporcionada logoutUser()
// para cerrar la sesión del usuario.
Future<String> sayGoodbye() async {
  try {
    final result = await logoutUser();
    return '$result Gracias, ¡hasta la próxima!';
  } catch (e) {
    return 'Error al cerrar sesión del usuario: $e';
  }
}

// Las siguientes funciones se proporcionan para que las uses en tus soluciones.

Future<String> fetchUsername() => Future.delayed(_halfSecond, () => 'Jean');

Future<String> logoutUser() => Future.delayed(_halfSecond, _failOnce);

// El siguiente código se utiliza para probar y proporcionar comentarios sobre tu solución.
// No es necesario leerlo ni modificarlo.

void main() async {
  const didNotImplement =
      'La prueba falló. ¿Olvidaste implementar o devolver algo desde';

  final List<String> messages = [];

  print('Probando...');
  try {
    messages
      ..add(_makeReadable(
          testLabel: 'Parte 1',
          testResult: await _asyncEquals(
              expected: 'Hello Jerry',
              actual: addHello('Jerry'),
              typoKeyword: 'Jerry'),
          readableErrors: {
            _typoMessage: _typoMessage,
            'null': '$didNotImplement addHello?',
            'Hello Instance of \'Future<String>\'':
                'Parece que olvidaste usar la palabra clave \'await\'!',
            'Hello Instance of \'_Future<String>\'':
                'Parece que olvidaste usar la palabra clave \'await\'!',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 2',
          testResult: await _asyncEquals(
              expected: 'Hello Jean',
              actual: await greetUser(),
              typoKeyword: 'Jean'),
          readableErrors: {
            _typoMessage: _typoMessage,
            'null': '$didNotImplement greetUser?',
            'HelloJean':
                'Parece que olvidaste el espacio entre \'Hello\' y \'Jean\'',
            'Hello Instance of \'Future<String>\'':
                'Parece que olvidaste usar la palabra clave \'await\'!',
            'Hello Instance of \'_Future<String>\'':
                'Parece que olvidaste usar la palabra clave \'await\'!',
            '{Closure: (String) => dynamic from Function \'addHello\': static.(await fetchUsername())}':
                '¿Colocaste correctamente el carácter \'$\'?',
            '{Closure \'addHello\'(await fetchUsername())}':
                '¿Colocaste correctamente el carácter \'$\'?',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 3',
          testResult: await _asyncDidCatchException(sayGoodbye),
          readableErrors: {
            _typoMessage:
                '$_typoMessage. ¿Añadiste el texto \'Gracias, ¡hasta la próxima!\'?',
            'null': '$didNotImplement sayGoodbye?',
            _noCatch:
                '¿Recordaste llamar a logoutUser dentro de un bloque try/catch?',
            'Instance of \'Future<String>\' Gracias, ¡hasta la próxima':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
            'Instance of \'_Future<String>\' Gracias, ¡hasta la próxima':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 3',
          testResult: await _asyncEquals(
              expected: 'Éxito. Gracias, ¡hasta la próxima!',
              actual: await sayGoodbye(),
              typoKeyword: 'Éxito'),
          readableErrors: {
            _typoMessage:
                '$_typoMessage. ¿Añadiste el texto \'Gracias, ¡hasta la próxima!\'?',
            'null': '$didNotImplement sayGoodbye?',
            _noCatch:
                '¿Recordaste llamar a logoutUser dentro de un bloque try/catch?',
            'Instance of \'Future<String>\' Gracias, ¡hasta la próxima':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
            'Instance of \'_Future<String>\' Gracias, ¡hasta la próxima':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
            'Instance of \'_Exception\'':
                'CAUGHT ¿Recordaste devolver una cadena?',
          }))
      ..removeWhere((m) => m.contains(_passed))
      ..toList();

    if (messages.isEmpty) {
      print('Éxito. Todas las pruebas pasaron!');
    } else {
      messages.forEach(print);
    }
  } catch (e) {
    print('Se intentó ejecutar la solución, pero se recibió una excepción: $e');
  }
}

// Ayudantes de prueba.
String _makeReadable({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  String? readable;
  if (readableErrors

// Parte 1
// Llama a la función asíncrona proporcionada fetchRole()
// para devolver el rol del usuario.
Future<String> reportUserRole() async {
  final username = await fetchRole();
  return 'User role: $username';
}

// Parte 2
// TODO: Implementar la función reportLogins aquí.
Future<String> reportLogins() async {
  final logins = await fetchLoginAmount();
  return 'Total number of logins: $logins';
}
// Llama a la función asíncrona proporcionada fetchLoginAmount()
// para devolver el número de veces que el usuario ha iniciado sesión.

// Las siguientes funciones son proporcionadas para simular
// operaciones asíncronas que podrían llevar un tiempo.

Future<String> fetchRole() => Future.delayed(_halfSecond, () => _role);
Future<int> fetchLoginAmount() => Future.delayed(_halfSecond, () => _logins);

// El siguiente código se utiliza para probar y proporcionar retroalimentación sobre tu solución.
// No es necesario leerlo ni modificarlo.

void main() async {
  print('Probando...');
  List<String> messages = [];
  const passed = 'PASSED';
  const testFailedMessage = 'Prueba fallida para la función:';
  const typoMessage = '¡Prueba fallida! Revisa si hay errores tipográficos en el valor devuelto';
  try {
    messages
      ..add(_makeReadable(
          testLabel: 'Parte 1',
          testResult: await _asyncEquals(
            expected: 'User role: administrator',
            actual: await reportUserRole(),
            typoKeyword: _role,
          ),
          readableErrors: {
            typoMessage: typoMessage,
            'null':
                '¡Prueba fallida! ¿Olvidaste implementar o devolver desde reportUserRole?',
            'User role: Instance of \'Future<String>\'':
                '$testFailedMessage reportUserRole. ¿Usaste la palabra clave await?',
            'User role: Instance of \'_Future<String>\'':
                '$testFailedMessage reportUserRole. ¿Usaste la palabra clave await?',
            'User role:':
                '$testFailedMessage reportUserRole. ¿Devolviste un rol de usuario?',
            'User role: ':
                '$testFailedMessage reportUserRole. ¿Devolviste un rol de usuario?',
            'User role: tester':
                '$testFailedMessage reportUserRole. ¿Invocaste fetchRole para obtener el rol del usuario?',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 2',
          testResult: await _asyncEquals(
            expected: 'Total number of logins: 42',
            actual: await reportLogins(),
            typoKeyword: _logins.toString(),
          ),
          readableErrors: {
            typoMessage: typoMessage,
            'null':
                '¡Prueba fallida! ¿Olvidaste implementar o devolver desde reportLogins?',
            'Total number of logins: Instance of \'Future<int>\'':
                '$testFailedMessage reportLogins. ¿Usaste la palabra clave await?',
            'Total number of logins: Instance of \'_Future<int>\'':
                '$testFailedMessage reportLogins. ¿Usaste la palabra clave await?',
            'Total number of logins: ':
                '$testFailedMessage reportLogins. ¿Devolviste el número de sesiones iniciadas?',
            'Total number of logins:':
                '$testFailedMessage reportLogins. ¿Devolviste el número de sesiones iniciadas?',
            'Total number of logins: 57':
                '$testFailedMessage reportLogins. ¿Invocaste fetchLoginAmount para obtener el número de sesiones iniciadas?',
          }))
      ..removeWhere((m) => m.contains(passed))
      ..toList();

    if (messages.isEmpty) {
      print('¡Éxito! Todas las pruebas pasaron.');
    } else {
      messages.forEach(print);
    }
  } on UnimplementedError {
    print(
        '¡Prueba fallida! ¿Olvidaste implementar o devolver desde reportUserRole?');
  } catch (e) {
    print('Se intentó ejecutar la solución, pero se recibió una excepción: $e');
  }
}

const _role = 'administrator';
const _logins = 42;
const _halfSecond = Duration(milliseconds: 500);

// Funciones de prueba auxiliares.
String _makeReadable({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  if (readableErrors.containsKey(testResult)) {
    var readable = readableErrors[testResult];
    return '$testLabel $readable';
  } else {
    return '$testLabel $testResult';
  }
}

// Asertos utilizados en las pruebas.
Future<String> _asyncEquals({
  required String expected,
  required dynamic actual,
  required String typoKeyword,
}) async {
  var strActual = actual is String ? actual : actual.toString();
  try {
    if (expected == actual) {
      return 'PASSED';
    } else if (strActual.contains(typoKeyword)) {
      return '¡Prueba fallida! Revisa si hay errores tipográficos en el valor devuelto';
    } else {
      return strActual;
    }
  } catch (e) {
    return e.toString();
  }
}

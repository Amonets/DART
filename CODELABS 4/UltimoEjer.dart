//Ejercicio: Poniéndolo todo junto
// Definición de la función parseEmailAddresses, que convierte una lista de cadenas en una lista de direcciones de correo electrónico
Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  // Utiliza la función map para crear una lista de direcciones de correo electrónico a partir de las cadenas proporcionadas
  return strings.map((s) => EmailAddress(s));
}

// Definición de la función anyInvalidEmailAddress, que verifica si hay alguna dirección de correo electrónico inválida en la lista
bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  // Utiliza la función any para verificar si alguna dirección de correo electrónico es inválida
  return emails.any((email) => !isValidEmailAddress(email));
}

// Definición de la función validEmailAddresses, que filtra las direcciones de correo electrónico válidas de una lista
Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  // Utiliza la función where para filtrar las direcciones de correo electrónico válidas
  return emails.where((email) => isValidEmailAddress(email));
}

// Definición de la clase EmailAddress, que representa una dirección de correo electrónico
class EmailAddress {
  final String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAddress && address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() => 'EmailAddress{address: $address}';
}

// La siguiente parte del código se utiliza para proporcionar retroalimentación sobre tu solución.
// No es necesario leer o modificarla.
void main() {
  const input = [
    'ali@gmail.com',
    'bobgmail.com',
    'cal@gmail.com',
  ];

  const correctInput = ['dash@gmail.com', 'sparky@gmail.com'];

  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (var index = 0; index < a.length; index += 1) {
      if (a[index] != b[index]) return false;
    }
    return true;
  }

  // Declaración de variables para almacenar las direcciones de correo electrónico
  final Iterable<EmailAddress> emails;
  final Iterable<EmailAddress> correctEmails;
  try {
    // Parsea las direcciones de correo electrónico de entrada
    emails = parseEmailAddresses(input);
    correctEmails = parseEmailAddresses(correctInput);
    // Verifica si se obtuvo una lista vacía
    if (emails.isEmpty) {
      print(
        'Intentaste ejecutar `parseEmailAddresses`, pero recibiste una lista vacía.',
      );
      return;
    }
    // Verifica si las direcciones de correo electrónico parseadas coinciden con las esperadas
    if (!_listEquals(emails.toList(), [
      EmailAddress('ali@gmail.com'),
      EmailAddress('bobgmail.com'),
      EmailAddress('cal@gmail.com'),
    ])) {
      print('Parece que `parseEmailAddresses` está incorrecta. ¡Sigue intentando!');
      return;
    }
  } on UnimplementedError {
    // Maneja el caso en que la función no está implementada
    print(
      'Intentaste ejecutar `parseEmailAddresses`, pero recibiste un error. ¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Maneja cualquier otra excepción que pueda ocurrir
    print(
      'Intentaste ejecutar `parseEmailAddresses`, pero recibiste una excepción: $e',
    );
    return;
  }

  try {
    // Verifica si hay direcciones de correo electrónico inválidas en la lista
    final out = anyInvalidEmailAddress(emails);
    if (!out) {
      print(
        'Parece que `anyInvalidEmailAddress` está incorrecta. ¡Sigue intentando! '
        'El resultado debería ser falso con al menos una dirección inválida.',
      );
      return;
    }
    // Verifica si la función devuelve falso cuando todas las direcciones de correo electrónico son válidas
    final falseOut = anyInvalidEmailAddress(correctEmails);
    if (falseOut) {
      print(
        'Parece que `anyInvalidEmailAddress` está incorrecta. ¡Sigue intentando! '
        'El resultado debería ser falso con todas las direcciones válidas.',
      );
      return;
    }
  } on UnimplementedError {
    // Maneja el caso en que la función no está implementada
    print(
      'Intentaste ejecutar `anyInvalidEmailAddress`, pero recibiste un error. ¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Maneja cualquier otra excepción que pueda ocurrir
    print(
        'Intentaste ejecutar `anyInvalidEmailAddress`, pero recibiste una excepción: $e');
    return;
  }

  try {
    // Filtra las direcciones de correo electrónico válidas de la lista
    final valid = validEmailAddresses(emails);
    // Verifica si se obtuvo una lista vacía
    if (emails.isEmpty) {
      print('Intentaste ejecutar `validEmailAddresses`, pero recibiste una lista vacía.');
      return;
    }
    // Verifica si las direcciones de correo electrónico filtradas coinciden con las esperadas
    if (!_listEquals(valid.toList(), [
      EmailAddress('ali@gmail.com'),
      EmailAddress('cal@gmail.com'),
    ])) {
      print('Parece que `validEmailAddresses` está incorrecta. ¡Sigue intentando!');
      return;
    }
  } on UnimplementedError {
    // Maneja el caso en que la función no está implementada
    print(
      'Intentaste ejecutar `validEmailAddresses`, pero recibiste un error. ¿Implementaste la función?',
    );
    return;
  } catch (e) {
    // Maneja cualquier otra excepción que pueda ocurrir
    print(
      'Intentaste ejecutar `validEmailAddresses`, pero recibiste una excepción: $e',
    );
    return;
  }

  // Imprime un mensaje de éxito si todas las pruebas pasan
  print('Éxito. Todas las pruebas pasaron.');
}

// Función auxiliar que verifica si una dirección

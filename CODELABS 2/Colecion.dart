// Definición de la clase EmailAddress
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

// Función que verifica si una dirección de correo electrónico es válida
bool isValidEmailAddress(String string) {
  return string.contains('@');
}

// Parte 1: Implementación de la función parseEmailAddresses()
Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  // Mapear cada String a un objeto EmailAddress usando el constructor EmailAddress(String)
  return strings.map((s) => EmailAddress(s));
}

// Parte 2: Implementación de la función anyInvalidEmailAddress()
bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  // Verificar si hay algún EmailAddress inválido en el Iterable
  return emails.any((email) => !isValidEmailAddress(email.address));
}

// Parte 3: Implementación de la función validEmailAddresses()
Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  // Filtrar los EmailAddress válidos del Iterable usando la función isValidEmailAddress()
  return emails.where((email) => isValidEmailAddress(email.address));
}

// Función principal donde se ejecutan las pruebas
void main() {
  // Definición de las direcciones de correo electrónico de prueba
  const input = [
    'ali@gmail.com',
    'bobgmail.com',
    'cal@gmail.com',
  ];

  const correctInput = ['dash@gmail.com', 'sparky@gmail.com'];

  // Función auxiliar para verificar la igualdad de dos listas
  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (var index = 0; index < a.length; index += 1) {
      if (a[index] != b[index]) return false;
    }
    return true;
  }

  // Declaración de variables para almacenar los resultados de las funciones
  final Iterable<EmailAddress> emails;
  final Iterable<EmailAddress> correctEmails;

  // Se intenta ejecutar parseEmailAddresses() con las direcciones de prueba
  try {
    emails = parseEmailAddresses(input);
    correctEmails = parseEmailAddresses(correctInput);
    // Verificación de resultados
    if (emails.isEmpty) {
      print(
        'Tried running `parseEmailAddresses`, but received an empty list.',
      );
      return;
    }
    if (!_listEquals(emails.toList(), [
      EmailAddress('ali@gmail.com'),
      EmailAddress('bobgmail.com'),
      EmailAddress('cal@gmail.com'),
    ])) {
      print('Looks like `parseEmailAddresses` is wrong. Keep trying!');
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `parseEmailAddresses`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running `parseEmailAddresses`, '
      'but received an exception: $e',
    );
    return;
  }

  // Se intenta ejecutar anyInvalidEmailAddress() con las direcciones de prueba
  try {
    final out = anyInvalidEmailAddress(emails);
    if (!out) {
      print(
        'Looks like `anyInvalidEmailAddress` is wrong. Keep trying! '
        'The result should be false with at least one invalid address.',
      );
      return;
    }
    final falseOut = anyInvalidEmailAddress(correctEmails);
    if (falseOut) {
      print(
        'Looks like `anyInvalidEmailAddress` is wrong. Keep trying! '
        'The result should be false with all valid addresses.',
      );
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `anyInvalidEmailAddress`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
        'Tried running `anyInvalidEmailAddress`, but received an exception: $e');
    return;
  }

  // Se intenta ejecutar validEmailAddresses() con las direcciones de prueba
  try {
    final valid = validEmailAddresses(emails);
    if (emails.isEmpty) {
      print('Tried running `validEmailAddresses`, but received an empty list.');
      return;
    }
    if (!_listEquals(valid.toList(), [
      EmailAddress('ali@gmail.com'),
      EmailAddress('cal@gmail.com'),
    ])) {
      print('Looks like `validEmailAddresses` is wrong. Keep trying!');
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `validEmailAddresses`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running the `validEmailAddresses`, '
      'but received an exception: $e',
    );
    return;
  }

  // Si todas las pruebas pasan, se imprime este mensaje
  print('Success. All tests passed!');
}

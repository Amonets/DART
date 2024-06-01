// Simulamos el comportamiento de fetchUsername y logoutUser
Future<String> fetchUsername() => Future.delayed(Duration(milliseconds: 500), () => 'Jean');
Future<String> logoutUser() => Future.delayed(Duration(milliseconds: 500), () => 'Logout successful');

// Parte 1
String addHello(String user) {
  return 'Hello $user';
}

// Parte 2
Future<String> greetUser() async {
  final username = await fetchUsername();
  return addHello(username);
}

// Parte 3
Future<String> sayGoodbye() async {
  try {
    final result = await logoutUser();
    return '$result. Thanks, see you next time';
  } catch (e) {
    return 'Error: $e. Thanks, see you next time';
  }
}

void main() async {
  print('Parte 1: ${addHello("Jerry")}'); //Parte 1
  print('Parte 2: ${await greetUser()}'); //Parte 2
  print('Parte 3: ${await sayGoodbye()}'); //Parte 3
}

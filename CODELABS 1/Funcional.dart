//Código funcional
String scream(int length) => "A${'a' * length}h!";

void main() {
  final values = [1, 2, 3, 5, 10, 50];
  values.map(scream).forEach(print);
}
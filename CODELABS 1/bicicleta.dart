//clase basica y constructores
class Bicycle {
  int cadence;
  int _speed = 0;
  int get speed => _speed;
  int gear;

  //constructor que inicializa las propiedades cadence y gear
  Bicycle(this.cadence, this.gear);
//metodo para aplicar freno y decrementa la velocidad
  void applyBrake(int decrement) {
    _speed -= decrement;
  }
//metodo para acelerar incrementa la velocidad
  void speedUp(int increment) {
    _speed += increment;
  }

//Sobrescribir el método toString para proporcionar una representancion
  @override
  String toString() => 'Bicycle: $_speed mph';
}

void main() {
// Crear una instancia de Bicycle
  var bike = Bicycle(2, 1);
  //imprimir la presentacion esto llamara al metodo tostring
  print(bike); //tiene que imprimir 0 mph
}
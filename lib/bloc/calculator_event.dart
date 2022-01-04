abstract class CalculatorEvent {}

class Add extends CalculatorEvent {
  final String inputAdd1;
  final String inputAdd2;

  Add(this.inputAdd1, this.inputAdd2);
}

class Division extends CalculatorEvent {
  final String inputDiv1;
  final String inputDiv2;

  Division(this.inputDiv1, this.inputDiv2);
}

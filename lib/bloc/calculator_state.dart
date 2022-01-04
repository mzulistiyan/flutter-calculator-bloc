import 'package:equatable/equatable.dart';

abstract class CalculatorState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialCalculated extends CalculatorState {
  final double result;

  InitialCalculated(this.result);

  @override
  List<Object> get props => super.props..addAll([result]);
}

class Calculated extends CalculatorState {
  final double result;

  Calculated(this.result);

  @override
  List<Object> get props => super.props..addAll([result]);
}

class CalculatedError extends CalculatorState {
  final String message;

  CalculatedError(this.message);

  @override
  List<Object> get props => super.props..addAll([message]);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator_bloc/bloc/calculator_event.dart';
import 'package:flutter_calculator_bloc/bloc/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  @override
  CalculatorState get initialState => InitialCalculated(0);

  @override
  Stream<CalculatorState> mapEventToState(CalculatorEvent event) async* {
    try {
      if (event is Add) {
        double angka1 = double.parse(event.inputAdd1);
        double angka2 = double.parse(event.inputAdd2);
        double hasil = angka1 + angka2;
        yield Calculated(hasil);
      } else if (event is Division) {
        double angka1 = double.parse(event.inputDiv1);
        double angka2 = double.parse(event.inputDiv2);
        double hasil = angka1 / angka2;
        yield Calculated(hasil);
      }
    } on FormatException catch (e) {
      yield CalculatedError("Harus Angka");
    } catch (e) {
      yield CalculatedError(e.toString());
    }
  }
}

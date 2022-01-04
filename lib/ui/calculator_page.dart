import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator_bloc/bloc/calculator_bloc.dart';
import 'package:flutter_calculator_bloc/bloc/calculator_event.dart';
import 'package:flutter_calculator_bloc/bloc/calculator_state.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController _input1 = TextEditingController();
  TextEditingController _input2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
      create: (context) => CalculatorBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: BlocConsumer<CalculatorBloc, CalculatorState>(
          listener: (context, state) => {
            if (state is CalculatedError)
              {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)))
              }
          },
          builder: (context, state) => SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _input1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(4),
                    )),
                  ),
                  TextFormField(
                    controller: _input2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(4),
                    )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(32),
                    child: showResult(state),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          BlocProvider.of<CalculatorBloc>(context)
                              .add(Add(_input1.text, _input2.text));
                        },
                        color: Colors.blue,
                        child: Text('Tambah'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          BlocProvider.of<CalculatorBloc>(context)
                              .add(Division(_input1.text, _input2.text));
                        },
                        color: Colors.blue,
                        child: Text('Bagi'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget showResult(CalculatorState state) {
  if (state is Calculated) {
    return Text(
      '${state.result}',
      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    );
  } else {
    return const Text(
      '0',
      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    );
  }
}

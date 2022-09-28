import 'package:calculator/calculator_cubit/calculator_cubit.dart';
import 'package:calculator/calculator_cubit/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: MaterialApp(
        home: CalculatorView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

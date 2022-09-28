import 'package:calculator/calculator_cubit/calculator_state.dart';
import 'package:calculator/constants/list.dart';
import 'package:calculator/logic/funcs.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF17171C),
        body: Column(children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 75, left: 330),
                child: SizedBox(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
              flex: 1),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.green,
                child: Text('fadsfdsdsafdsf'),
              )),
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                            childAspectRatio: 3 / 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: 20,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Functions.checkColor(index),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            ListItems.items[index].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }),
              ))
        ]));
  }
}

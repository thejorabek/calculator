import 'package:calculator/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  var userQuestion = '';
  var userAnswer = '';
  final myTextStyle = TextStyle(fontSize: 30, color: Colors.deepPurple);
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17171C),
      body: Column(children: [
        Expanded(
            child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ]),
          ),
        )),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                          color: Color(0xFF2E2F38),
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      } else if (index == 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          color: Color(0xFF2E2F38),
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      } else if (index == buttons.length - 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          color: Color(0xFF4B5EFC),
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      } else {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          color: isOperator(buttons[index])
                              ? Color(0xFF4B5EFC)
                              : Color(0xFF4E505F),
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      }
                    })),
          ),
        )
      ]),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}

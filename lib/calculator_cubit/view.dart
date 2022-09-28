import 'package:calculator/widgets/widget.dart';
import 'package:flutter/material.dart';

class View extends StatefulWidget {
  const View({super.key});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  Container(
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
                      if (index == 0 || index == 1) {
                        return MyButton(
                          color: Color(0xFF2E2F38),
                          textColor: Colors.white,
                          buttonText: buttons[index],
                        );
                      } else {
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion+=buttons[index];
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
}

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {this.color,
      required this.buttonText,
      this.textColor,
      this.buttonTapped,
      super.key});

  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(color: textColor, fontSize: 20),
            )),
          )),
    );
  }
}

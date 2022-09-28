import 'package:calculator/calculator_cubit/calculator_state.dart';
import 'package:flutter/services.dart';

class Functions {
  static checkColor(int index) {
    if (index == 0 || index == 1 || index == 2) {
      return const Color(0xFF4E505F);
    } else if (index == 3 ||
        index == 7 ||
        index == 11 ||
        index == 15 ||
        index == 19) {
      return const Color(0xFF4B5EFC);
    } else {
      return const Color(0xFF2E2F38);
    }
  }

  static onPress(var index) {
    if(index=='C'){
      number='0';
    }else if(index=='4'){
      number+='4';
    }
    print(number);
  }
}

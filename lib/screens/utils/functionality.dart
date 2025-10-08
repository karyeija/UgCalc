import 'package:flutter/widgets.dart';
import 'package:ugcalc/widgets/buttons.dart';

class Functionality {
  static TextEditingController input = TextEditingController();
  static String result = "";
  static bool isDotUsed = false;
  static bool isOperatorUsed = false;
  static void appendInput(String s, Function setState) {
    setState(() {
      switch (s) {
        case String digit when Buttons.digitButtons.contains(s):
          input.text += digit;
          isOperatorUsed = false;
          break;
        case String _ when Buttons.clearAllButton.contains(s):
          input.text = "";
          result = "";
          isDotUsed = false;
          isOperatorUsed = false;
          break;
        case String _ when Buttons.delButton.contains(s):
          if (input.text.isNotEmpty) {
            input.text = input.text.substring(0, input.text.length - 1);
          }
          break;
        case String dot when Buttons.dotButton.contains(s):
          if (isDotUsed) {
            return;
          }
          if (input.text.isEmpty) {
            input.text += '0$dot';
            isDotUsed = true;
          } else {
            input.text += dot;
            isDotUsed = true;
          }
          break;
        case String op when Buttons.operatorButtons.contains(s):
          if (op == "=") {
            // Possibly evaluate expression here
          } else if (!isOperatorUsed) {
            input.text += op;
            isOperatorUsed = true;
            isDotUsed = false;
          }
          break;
      }
    });
  }
}

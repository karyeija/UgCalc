import 'package:ugcalc/widgets/buttons.dart';

class Functionality {
  static String input = "";
  static void appendInput(String s, Function setState) {
    setState(() {
      switch (s) {
        case String digit when Buttons.digitButtons.contains(s):
          input += digit;
          break;
        case String _ when Buttons.clearAllButton.contains(s):
          input = "";
          break;
        case String _ when Buttons.delButton.contains(s):
          input = input.substring(0, input.length - 1);
          break;
      }
    });
  }
}

import 'package:intl/intl.dart';

String safeFormatInput(String input) {
  NumberFormat fd = NumberFormat.decimalPattern();

  if (input.isNotEmpty && input != '0') {
    try {
      double value = double.parse(input);
      return fd.format(value);
    } catch (e) {
      // On error, return the original input string to keep the existing text visible
      return input;
    }
  }
  return input;
}

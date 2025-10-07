import 'package:flutter/material.dart';

Widget customButton({
  required VoidCallback? onpress,
  IconData icon = Icons.add,
  Color? bgcolor,
}) {
  final Color fgcolor = Colors.green;
  final Color buttonBgColor = bgcolor ?? Colors.green.shade900;

  return ElevatedButton(
    onPressed: onpress,
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonBgColor,
      foregroundColor: fgcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: Icon(icon, size: 20),
  );
}

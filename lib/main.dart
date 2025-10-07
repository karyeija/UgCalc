import 'package:flutter/material.dart';
import 'package:ugcalc/screens/home.dart';

void main() {
  runApp(const UgaKode());
}

class UgaKode extends StatelessWidget {
  const UgaKode({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(title: 'Home'),
    );
  }
}



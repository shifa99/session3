import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:session2/Screens/InputScreen.dart';

import 'Screens/ResultScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        InputScreen.routeName: (context) => InputScreen(),
        ResultScreen.routeName: (context) => ResultScreen(),
      },
      initialRoute: InputScreen.routeName,
    );
  }
}

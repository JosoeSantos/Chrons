import 'package:flutter/material.dart';
import 'package:unit_converter/Screens/clocking_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Chronos',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ClockingScreen(),
    );
  }
}

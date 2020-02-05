import 'package:flutter/material.dart';
import 'LoadScreen.dart';
//import 'package:demo/MainScreen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1B1B1D),
      ) ,
      home: LoadScreen()
    );
  }
}

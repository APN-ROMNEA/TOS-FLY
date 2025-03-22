import 'package:flutter/material.dart';
import 'package:final_project/HomePage.dart'; // Import for MainPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Akshar',
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
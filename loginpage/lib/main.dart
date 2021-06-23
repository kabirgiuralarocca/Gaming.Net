import 'package:flutter/material.dart';
import 'package:loginpage/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login page',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
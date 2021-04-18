import 'package:flutter/material.dart';
import 'package:nola_the_bot/register.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RegisterForm(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/views/CoffeeScreen.dart';

void main() {
  runApp(RootScreen());
}

class RootScreen extends StatelessWidget{

  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "testing app",
      home: CoffeeScreen(),
    );
  }
}
import 'package:skoczek_g6/screens/main_screen/body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
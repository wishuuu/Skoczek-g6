import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/register_screen/body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  static String routeName = "/register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

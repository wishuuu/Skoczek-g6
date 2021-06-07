import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/register_screen/body.dart';
import 'package:skoczek_g6/db_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key key}) : super(key: key);

  static String routeName = "/register";

  @override
  Widget build(BuildContext context) {
    DBManager dbManager = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(dbManager: dbManager,),
    );
  }
}

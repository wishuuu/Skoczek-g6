import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';

import 'package:skoczek_g6/screens/login_screen/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  static String routeName = "/login";

  static DBManager dbManager = DBManager();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => initDataBase(dbManager));
    return Scaffold(
      body: Body(dbManager: dbManager),
    );
  }
}

Future<void> initDataBase(DBManager dbManager) async {
  await dbManager.init();
}

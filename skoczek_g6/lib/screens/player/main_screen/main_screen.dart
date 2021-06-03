import 'package:skoczek_g6/screens/player/main_screen/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/player';
  @override
  Widget build(BuildContext context) {
    DBManager dbManager =
        ModalRoute.of(context).settings.arguments as DBManager;
    return Scaffold(
      body: Body(
        dbManager: dbManager,
      ),
    );
  }
}

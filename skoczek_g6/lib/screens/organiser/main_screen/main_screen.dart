import 'package:skoczek_g6/screens/organiser/main_screen/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';

class MainScreenOrganiser extends StatelessWidget {
  static String routeName = '/organiser';
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

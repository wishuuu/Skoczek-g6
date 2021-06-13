import 'package:skoczek_g6/screens/organiser/match_finish_screen/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';

class FinishScreen extends StatelessWidget {
  static String routeName = '/finishScreen';
  @override
  Widget build(BuildContext context) {
    DBManager dbManager =
        ModalRoute.of(context).settings.arguments as DBManager;
    return Scaffold(
      body: Body(dbManager: dbManager),
    );
  }
}

import 'package:skoczek_g6/screens/organiser/create_tournament/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/createTournament';
  @override
  Widget build(BuildContext context) {
    DBManager dbManager =
        ModalRoute.of(context).settings.arguments as DBManager;
    return Scaffold(
      body: Body(
      ),
    );
  }
}

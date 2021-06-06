import 'package:flutter/material.dart';
import 'package:skoczek_g6/screens/player/matches_screen/body.dart';

import 'package:skoczek_g6/db_manager.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key key}) : super(key: key);
  static String routeName = '/matches';
  @override
  Widget build(BuildContext context) {
    DBManager dbManager =
        ModalRoute.of(context).settings.arguments as DBManager;
    return Scaffold(
      body: Body(dbManager: dbManager),
    );
  }
}

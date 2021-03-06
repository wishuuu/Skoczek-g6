import 'package:skoczek_g6/screens/organiser/tournament_info/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';

class TournamentInfosOrganiser extends StatelessWidget {
  static String routeName = '/tournamentInfo';
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

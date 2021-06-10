import 'package:skoczek_g6/screens/organiser/your_tournaments/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';

class TournamentDetailsOrganiser extends StatelessWidget {
  static String routeName = '/tournamentDetails';
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

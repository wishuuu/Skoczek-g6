import 'package:skoczek_g6/screens/organiser/tournament_details/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/data_templates.dart';
import 'package:skoczek_g6/db_manager.dart';

class TournamentDetailsOrganiser extends StatelessWidget {
  static String routeName = '/tournamentDetails';
  @override
  Widget build(BuildContext context) {
    TournamentDetailsArguments args =
        ModalRoute.of(context).settings.arguments as TournamentDetailsArguments;
    DBManager dbManager = args.dbManager;
    int tournamentID = args.tournamentID;
    return Scaffold(
      body: Body(
        dbManager: dbManager,
        tournamentID: tournamentID,
      ),
    );
  }
}

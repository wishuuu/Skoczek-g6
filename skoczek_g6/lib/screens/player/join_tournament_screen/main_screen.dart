import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/screens/player/join_tournament_screen/body.dart';

class JoinTournament extends StatelessWidget {
  const JoinTournament({Key key}) : super(key: key);

  static String routeName = '/join';

  @override
  Widget build(BuildContext context) {
    DBManager dbManager = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(dbManager: dbManager),
    );
  }
}

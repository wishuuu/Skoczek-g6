import 'package:skoczek_g6/screens/organiser/match_finish_screen/body.dart';
import 'package:flutter/material.dart';

import 'package:skoczek_g6/data_templates.dart';

class FinishScreen extends StatelessWidget {
  static String routeName = '/finishScreen';
  @override
  Widget build(BuildContext context) {
    MatchFinalArguments args =
        ModalRoute.of(context).settings.arguments as MatchFinalArguments;
    return Scaffold(
      body: Body(dbManager: args.dbManager, matchID: args.matchID),
    );
  }
}

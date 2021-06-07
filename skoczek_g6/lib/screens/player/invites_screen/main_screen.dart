import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';

import 'package:skoczek_g6/screens/player/invites_screen/body.dart';

class InvitesScreen extends StatelessWidget {
  const InvitesScreen({Key key}) : super(key: key);

  static String routeName = '/invites';

  @override
  Widget build(BuildContext context) {
    DBManager dbManager = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(dbManager: dbManager),
    );
  }
}

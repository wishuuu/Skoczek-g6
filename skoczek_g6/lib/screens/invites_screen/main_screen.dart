import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/invites_screen/body.dart';

class InvitesScreen extends StatelessWidget {
  const InvitesScreen({Key key}) : super(key: key);

  static String routeName = '/invites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

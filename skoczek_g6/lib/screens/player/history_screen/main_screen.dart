import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/player/history_screen/body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);
  static String routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
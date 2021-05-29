import 'package:flutter/material.dart';
import 'package:skoczek_g6/screens/matches_screen/body.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key key}) : super(key: key);
  static String routeName = '/matches';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/analysis_screen/body.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key key}) : super(key: key);
  static String routeName = '/analysis';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
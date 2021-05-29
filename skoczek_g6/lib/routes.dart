import 'package:flutter/widgets.dart';

import 'package:skoczek_g6/screens/main_screen/main_screen.dart';
import 'package:skoczek_g6/screens/matches_screen/main_screen.dart';
import 'package:skoczek_g6/screens/analysis_screen/main_screen.dart';
import 'package:skoczek_g6/screens/invites_screen/main_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  MatchesScreen.routeName: (context) => MatchesScreen(),
  AnalysisScreen.routeName: (context) => AnalysisScreen(),
  InvitesScreen.routeName: (context) => InvitesScreen(),
};

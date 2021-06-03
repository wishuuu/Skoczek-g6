import 'package:flutter/widgets.dart';

import 'package:skoczek_g6/screens/player/main_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/matches_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/analysis_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/invites_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/history_screen/main_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  MatchesScreen.routeName: (context) => MatchesScreen(),
  AnalysisScreen.routeName: (context) => AnalysisScreen(),
  InvitesScreen.routeName: (context) => InvitesScreen(),
  HistoryScreen.routeName: (context) => HistoryScreen(),
};

import 'package:flutter/widgets.dart';

import 'package:skoczek_g6/screens/player/main_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/matches_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/analysis_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/invites_screen/main_screen.dart';
import 'package:skoczek_g6/screens/player/history_screen/main_screen.dart';
import 'package:skoczek_g6/screens/login_screen/main_screen.dart';
import 'package:skoczek_g6/screens/register_screen/main_screen.dart';

import 'package:skoczek_g6/screens/organiser/main_screen/main_screen.dart';
import 'package:skoczek_g6/screens/organiser/create_tournament/main_screen.dart';

final Map<String, WidgetBuilder> routes = {
  MainScreen.routeName: (context) => MainScreen(),
  MatchesScreen.routeName: (context) => MatchesScreen(),
  AnalysisScreen.routeName: (context) => AnalysisScreen(),
  InvitesScreen.routeName: (context) => InvitesScreen(),
  HistoryScreen.routeName: (context) => HistoryScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  MainScreenOrganiser.routeName: (context) => MainScreenOrganiser(),
  CreateTournament.routeName: (context) => CreateTournament(),
};

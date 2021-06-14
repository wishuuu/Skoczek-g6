import 'package:skoczek_g6/db_manager.dart';

class MatchData {
  MatchData(
    this.id,
    this.opponentName,
    this.date,
    this.tableNumber,
  );

  int id;
  String opponentName;
  String date;
  int tableNumber;
}

class InviteData {
  InviteData(
    this.id,
    this.tournamentName,
    this.date,
  );

  int id;
  String tournamentName;
  String date;
}

class TournamentDetailsArguments {
  TournamentDetailsArguments(this.tournamentID, this.dbManager);

  int tournamentID;
  DBManager dbManager;
}

class MatchFinalArguments {
  MatchFinalArguments(this.matchID, this.dbManager);

  int matchID;
  DBManager dbManager;
}

class DetailsData {
  DetailsData(
    this.id,
    this.date,
    this.place,
    this.winner,
    this.name,
    this.numOfTables,
    this.isOpen,
    this.numOfPlayers,
  );

  int id;
  String date;
  String place;
  String winner;
  String name;
  int numOfTables;
  bool isOpen;
  int numOfPlayers;
}

class TournamentMatch {
  TournamentMatch(
    this.white,
    this.black,
    this.winner,
    this.ID,
  );
  int white;
  int black;
  int winner;
  int ID;
}

class TournamentPlayer {
  TournamentPlayer(
    this.playerID,
    this.score,
  );

  int playerID;
  double score;
}

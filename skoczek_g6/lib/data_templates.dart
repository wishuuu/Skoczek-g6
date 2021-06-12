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

  TournamentDetailsArguments(
    this.tournamentID,
    this.dbManager
  );

  int tournamentID;
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
    this.isOpen
  );

  int id;
  String date;
  String place;
  String winner;
  String name;
  int numOfTables;
  bool isOpen;
}
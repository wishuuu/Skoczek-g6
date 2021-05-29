class MatchData {
  MatchData(
    String this.opponentName,
    String this.date,
    int this.tableNumber,
  );

  String opponentName;
  String date;
  int tableNumber;
}

class InviteData {
  InviteData(
    String this.tournamentName,
    String this.date,
  );

  String tournamentName;
  String date;
}
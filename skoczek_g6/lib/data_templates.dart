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

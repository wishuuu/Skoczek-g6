import 'package:mysql1/mysql1.dart';
import 'package:skoczek_g6/data_templates.dart';

class DBManager {
  int userId = -1;
  MySqlConnection conn;
  String firstName;

  DBManager([this.userId]);

  Future<void> init() async {
    var settings = new ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        password: 'root',
        db: 'skoczek_g6');
    this.conn = await MySqlConnection.connect(settings);
  }

  Future<bool> loginUser(nickname, password) async {
    var results = await conn.query(
        'SELECT ID '
        'FROM user '
        'WHERE nickname = ? AND password = ?',
        [nickname, password]);

    for (var row in results) {
      if (row[0] == null) break;
      this.userId = row[0];
    }

    await this.readName();

    return this.userId == 0 ? false : true;
  }

  void logout() {
    this.userId = -1;
  }

  Future<bool> checkOrganiser() async {
    var results = await conn.query(
        'SELECT isOrganiser '
        'FROM user '
        'WHERE ID = ?',
        [this.userId]);
    for (var row in results) {
      return row[0] > 0;
    }
    return false;
  }

  Future<void> readName() async {
    var results = await conn.query(
        'SELECT firstName '
        'FROM user '
        'WHERE ID = ?',
        [this.userId]);
    for (var row in results) {
      if (row[0] == null) break;
      this.firstName = row[0];
      break;
    }
  }

  Future<List> readMatches() async {
    List<MatchData> array = [];
    var results = await conn.query(
      'SELECT game.ID, user.nickname, game.date, game.time, game.tableID '
      'FROM game JOIN user ON user.ID = game.white OR user.ID = game.black '
      'WHERE user.ID != ? AND CURDATE() <= game.date',
      [this.userId],
    );

    for (var row in results) {
      if (row[0] == null) break;
      array.add(
        MatchData(
          row[0],
          row[1],
          row[2].toString().substring(0, 10),
          row[4] != null ? row[3] : -1,
        ),
      );
    }
    return array;
  }

  Future<List> readHistory() async {
    List<MatchData> array = [];
    var results = await conn.query(
        'SELECT game.ID, user.nickname, game.date, game.time, game.tableID '
        'FROM game JOIN user ON user.ID = game.white OR user.ID = game.black '
        'WHERE user.ID != ? AND CURDATE() > game.date AND game.moves IS NOT NULL',
        [this.userId]);
    for (var row in results) {
      if (row[0] == null) break;
      array.add(
        MatchData(
          row[0],
          row[1],
          row[2].toString().substring(0, 10),
          row[4] != null ? row[3] : -1,
        ),
      );
    }
    return array;
  }

  Future<List> readInvites() async {
    List<InviteData> array = [];
    var results = await conn.query(
        'SELECT tournament.name, tournament.date, tournament.ID '
        'FROM user_tournament JOIN tournament ON user_tournament.tournamentID = tournament.ID '
        'WHERE user_tournament.userID = ? AND user_tournament.inInvitationAccepted = 0 AND CURDATE() < tournament.date',
        [this.userId]);
    for (var row in results) {
      if (row[0] == null) break;
      array.add(
        InviteData(
          row[2],
          row[0],
          row[1].toString().substring(0, 10),
        ),
      );
    }

    return array;
  }

  Future<int> registerUser(
      login, password, ranking, imie, nazwisko, email) async {
    var results = await conn.query(
        'SELECT ID '
        'FROM user '
        'WHERE nickname = ?',
        [login]);
    for (var row in results) {
      if (row[0] != null) return 1;
    }
    results = await conn.query(
        'SELECT ID '
        'FROM user '
        'WHERE email = ?',
        [email]);
    for (var row in results) {
      if (row[0] != null) return 2;
    }
    await conn.query(
        'INSERT INTO user (nickname, password, ranking, firstName, lastName, email) '
        'VALUES (?, ?, ?, ?, ?, ?)',
        [login, password, ranking, imie, nazwisko, email]);
    return 0;
  }

  Future<int> joinTournament(tournamentID) async {
    var results = await conn.query(
        'SELECT * '
        'FROM tournament '
        'WHERE ID = ?',
        [tournamentID]);
    if (results.length == 0) return 1;
    results = await conn.query(
        'SELECT * '
        'FROM user_tournament '
        'WHERE tournamentID = ? AND userID = ?',
        [tournamentID, this.userId]);
    for (var row in results) {
      if (row[0] != null) return 2;
    }
    results = await conn.query(
        'SELECT ID '
        'FROM tournament '
        'WHERE ID = ? AND isOpen = true',
        [tournamentID]);
    if (results.length == 0) return 3;
    await conn.query(
        'INSERT INTO user_tournament(userID, tournamentID, inInvitationAccepted) '
        'VALUES (?, ?, ?)',
        [this.userId, tournamentID, true]);
    return 0;
  }

  Future<int> createTournament(
      tournamentName, date, numofTables, place, isOpen) async {
    var results = await conn.query(
        'SELECT ID '
        'FROM tournament '
        'WHERE name = ? AND organiserID = ?',
        [tournamentName, this.userId]);
    for (var _ in results) {
      return -2;
    }
    await conn.query(
        'INSERT INTO tournament(date, place, name, numOfTables, isOpen, organiserID) '
        'VALUES (?, ?, ?, ?, ?, ?)',
        [
          date,
          place,
          tournamentName,
          numofTables == 0 ? null : numofTables,
          isOpen,
          this.userId
        ]);
    results = await conn.query(
        'SELECT ID '
        'FROM tournament '
        'WHERE name = ? AND organiserID = ?',
        [tournamentName, this.userId]);
    for (var row in results) {
      return row[0];
    }
    return -1;
  }

  Future<List> readTournaments() async {
    List<InviteData> array = [];

    var results = await conn.query(
        'SELECT name, ID, date '
        'FROM tournament '
        'WHERE organiserID = ? '
        'ORDER BY date DESC',
        [this.userId]);

    for (var row in results) {
      if (row[0] == Null) break;
      array.add(
        InviteData(
          row[1],
          row[0],
          row[2].toString().substring(0, 10),
        ),
      );
    }

    return array;
  }

  Future<DetailsData> readTournamentDetails(tournamentID) async {
    var results = await conn.query(
        'SELECT date, place, winner, name, numOfTables, isOpen '
        'FROM tournament '
        'WHERE ID = ?',
        [tournamentID]);

    for (var row in results) {
      String nickname;

      if (row[2] != Null) {
        var winner = await conn.query(
            'SELECT nickname '
            'FROM user '
            'WHERE ID = ?',
            [row[2]]);
        for (var name in winner) {
          nickname = name[0];
        }
      } else
        nickname = "";
      int numOfPlayers = 0;
      var players = await conn.query(
          'SELECT COUNT(*) '
          'FROM user_tournament '
          'WHERE tournamentID=?',
          [tournamentID]);
      for (var nop in players) numOfPlayers = nop[0];

      return DetailsData(tournamentID, row[0].toString().substring(0, 10),
          row[1], nickname, row[3], row[4], row[5] == 1, numOfPlayers);
    }
  }

  Future<List> readPlayers(tournamentID) async {
    List<int> players = [];
    var result = await conn.query(
        'SELECT	userID '
        'FROM user_tournament '
        'JOIN user on user_tournament.userID = user.ID '
        'WHERE user_tournament.tournamentID = ? '
        'ORDER BY user.ranking DESC',
        [tournamentID]);
    for (var row in result) {
      players.add(row[0]);
    }

    return players;
  }

  Future<List> readTournamentMatches(tournamentID) async {
    List<TournamentMatch> matches = [];
    var result = await conn.query(
        'SELECT white, black, winner '
        'FROM game '
        'WHERE tournamentID = ?',
        [tournamentID]);
    for (var row in result) {
      matches.add(TournamentMatch(row[0], row[1], row[2]));
    }

    return matches;
  }
}

import 'package:mysql1/mysql1.dart';
import 'package:skoczek_g6/data_templates.dart';

class DBManager {
  int userId = 0;
  MySqlConnection conn;

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
    return this.userId == 0 ? false : true;
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
        'SELECT ID '
        'FROM tournament '
        'WHERE ID = ?',
        [tournamentID]);
    for (var row in results) {
      if (row[0] == null) return 1;
      break;
    }
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
    for (var row in results) {
      if (row[0] == null) return 3;
      break;
    }
    await conn.query(
        'INSERT INTO user_tournament(userID, tournamentID, inInvitationAccepted) '
        'VALUES (?, ?, ?)',
        [this.userId, tournamentID, true]);
    return 0;
  }
}

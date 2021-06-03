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
      'SELECT user.nickname, game.date, game.time, game.tableID '
      'FROM game JOIN user ON user.ID = game.white OR user.ID = game.black '
      'WHERE user.ID != ?',
      [this.userId],
    );

    for (var row in results) {
      if (row[0] == null) break;
      array.add(
        MatchData(
          row[0],
          row[1].toString().substring(0, 10),
          row[3] != null ? row[3] : -1,
        ),
      );
    }
    return array;
  }
}

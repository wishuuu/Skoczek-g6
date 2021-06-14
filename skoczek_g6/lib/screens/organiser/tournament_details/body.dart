import 'package:flutter/material.dart';
import 'package:skoczek_g6/data_templates.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/main.dart';

import 'package:skoczek_g6/screens/organiser/tournament_details/components/upper_bar.dart';
import 'package:skoczek_g6/screens/organiser/tournament_details/components/item_list.dart';
import 'package:skoczek_g6/screens/organiser/tournament_details/components/button.dart';

class Body extends StatefulWidget {
  Body({Key key, this.tournamentID, this.dbManager}) : super(key: key);

  final int tournamentID;
  final DBManager dbManager;

  bool isLoadingCompleted = false;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Widget> widgetsToShow = [];
  List<TournamentMatch> matches = [];
  DetailsData data;

  void loadData(Size size, context) {
    widget.isLoadingCompleted = true;
    Future(() async => {
          widgetsToShow = [UpperBar(size: size)],
          data =
              await widget.dbManager.readTournamentDetails(widget.tournamentID),
          matches = await widget.dbManager.readTournamentMatches(data.id),
          setState(() {
            widgetsToShow.add(ItemList(
              string1: 'ID:',
              string2: data.id.toString(),
            ));
            widgetsToShow.add(ItemList(string1: 'Name:', string2: data.name));
            widgetsToShow.add(ItemList(string1: 'Date:', string2: data.date));
            widgetsToShow.add(ItemList(string1: 'Place:', string2: data.place));
            if (data.numOfTables != null) {
              widgetsToShow.add(ItemList(
                  string1: 'Tables:', string2: data.numOfTables.toString()));
            }
            widgetsToShow.add(ItemList(
                string1: 'Is Open:', string2: data.isOpen ? 'Yes' : 'No'));
            if (data.isOpen) {
              widgetsToShow.add(Button(
                  string1: 'Zamknij turniej',
                  func: () async => {
                        await widget.dbManager.closeTournament(data.id),
                        loadData(size, context)
                      }));
            } else {
              widgetsToShow.add(Button(
                  string1: 'Wygeneruj partie',
                  func: () async =>
                      {await generateMatches(new DateTime.now())}));
            }
            widgetsToShow.add(ItemList(
              string1: 'Zaplanowane Partie:',
              string2: '',
            ));
            for (TournamentMatch match in matches) {
              widgetsToShow.add(Button(
                string1: match.ID.toString(),
                func: () => Navigator.pushNamed(
                  context,
                  '/finishScreen',
                  arguments: MatchFinalArguments(
                    match.ID,
                    widget.dbManager,
                  ),
                ),
              ));
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (!widget.isLoadingCompleted) {
      widgetsToShow = [];
      loadData(size, context);
    }
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          child: FittedBox(
            child: Image.asset(
              "assets/img/background.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Color(0x80E9E9D5),
          ),
        ),
          SingleChildScrollView(
            child: Column(
              children: widgetsToShow,
            ),
          ),
        UpperBar(size: size),
      ],
    );
  }

  Future<void> generateMatches(date) async {
    List playersID = await widget.dbManager.readPlayers(data.id);
    List scores = [];
    List<TournamentPlayer> players = [];
    List matches = await widget.dbManager.readTournamentMatches(data.id);
    List newMatches = [];

    if (matches.length == 0) {
      for (int i = 0; i < playersID.length; i++) {
        players.add(TournamentPlayer(playersID[i], 0));
      }
      int middle = players.length ~/ 2;
      for (int i = 0; i < middle; i++) {
        newMatches.add(TournamentMatch(
            players[i % 2 == 0 ? i : middle + i].playerID,
            players[i % 2 == 0 ? middle + i : i].playerID,
            0,
            null));
      }
    } else {
      for (int i = 0; i < playersID.length; i++) {
        players.add(TournamentPlayer(playersID[i], 0));
      }
      for (int i = 0; i < players.length; i++) {
        players[i].score =
            await widget.dbManager.readScores(data.id, players[i].playerID);
      }
      players.sort((a, b) => a.score.compareTo(b.score));
      for (int i = 0; i < players.length / 2 - players.length % 2; i++) {
        newMatches.add(TournamentMatch(
            players[i % 2 == 0 ? 2 * i + 1: 2 * i].playerID,
            players[i % 2 == 0 ? 2 * i : 2 * i + 1].playerID,
            0,
            null));
      }
    }
    if (players.length % 2 == 1)
      newMatches.add(TournamentMatch(
          players[players.length - 1].playerID,
          players[players.length - 1].playerID,
          players[players.length - 1].playerID,
          null));

    for (TournamentMatch match in newMatches) {
      await widget.dbManager
          .writeMatch(match.white, match.black, date, data.id, match.winner);
    }
  }
}

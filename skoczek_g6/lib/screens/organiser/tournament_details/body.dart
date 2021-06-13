import 'package:flutter/material.dart';
import 'package:skoczek_g6/data_templates.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/main.dart';

import 'package:skoczek_g6/screens/organiser/tournament_details/components/upper_bar.dart';
import 'package:skoczek_g6/screens/organiser/tournament_details/components/item_list.dart';

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
  DetailsData data;

  void loadData(Size size, context) {
    widget.isLoadingCompleted = true;
    Future(() async => {
          data =
              await widget.dbManager.readTournamentDetails(widget.tournamentID),
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
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (!widget.isLoadingCompleted) {
      widgetsToShow = [
        UpperBar(size: size),
      ];
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
        Column(children: widgetsToShow)
      ],
    );
  }

  Future<void> generateMatches() async {
    List players = await widget.dbManager.readPlayers(data.id);
    List scores = [];
    List matches = await widget.dbManager.readTournamentMatches(data.id);
    List newMatches = [];

    if (matches.length == 0) {}
  }
}

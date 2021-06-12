import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';

import 'package:skoczek_g6/screens/organiser/your_tournaments/components/upper_bar.dart';
import 'package:skoczek_g6/screens/organiser/your_tournaments/components/item_list.dart';
import 'package:skoczek_g6/data_templates.dart';

class Body extends StatefulWidget {
  bool isLoadingCompleted = false;
  final DBManager dbManager;

  Body({Key key, this.dbManager}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Widget> widgetsToShow;
  List<InviteData> data;

  void loadData(Size size, context) {
    widget.isLoadingCompleted = true;
    Future(
      () async => {
        data = await widget.dbManager.readTournaments(),
        setState(
          () {
            widgetsToShow.addAll(generateWidgets(size, data, context, widget.dbManager));
          },
        ),
      },
    );
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
        Column(children: widgetsToShow),
      ],
    );
  }
}

List<Widget> generateWidgets(
  Size size,
  List<InviteData> tournamentsDataList,
  context,
  dbManager,
) {
  List<Widget> list = [];
  for (var i = 0; i < tournamentsDataList.length; i++) {
    list.add(
      ItemList(
        size: size,
        tournamentID: tournamentsDataList[i].id,
        tournamentName: tournamentsDataList[i].tournamentName,
        date: tournamentsDataList[i].date,
        func: () => Navigator.pushNamed(context, '/tournamentDetails', arguments: TournamentDetailsArguments(tournamentsDataList[i].id, dbManager)),
      ),
    );
  }
  return list;
}

import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';

import 'package:skoczek_g6/screens/player/matches_screen/components/loading_message.dart';
import 'package:skoczek_g6/screens/player/matches_screen/components/upper_bar.dart';
import 'package:skoczek_g6/screens/player/matches_screen/components/item_list.dart';
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
  List<MatchData> data;

  void loadData(Size size) {
    widget.isLoadingCompleted = true;
    Future(
      () async => {
        data = await widget.dbManager.readMatches(),
        setState(
          () {
            widgetsToShow.removeAt(1);
            widgetsToShow.addAll(generateWidgets(size, data));
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
        LoadingMessage(size: size),
      ];
      loadData(size);
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
  List<MatchData> matchesDataList,
) {
  List<Widget> list = [];
  for (var i = 0; i < matchesDataList.length; i++) {
    list.add(
      ItemList(
        size: size,
        opponentName: matchesDataList[i].opponentName,
        date: matchesDataList[i].date,
        tableNumber: matchesDataList[i].tableNumber,
      ),
    );
  }
  return list;
}

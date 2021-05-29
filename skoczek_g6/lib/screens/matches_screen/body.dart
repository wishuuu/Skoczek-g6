import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/matches_screen/components/upper_bar.dart';
import 'package:skoczek_g6/screens/matches_screen/components/item_list.dart';
import 'package:skoczek_g6/data_templates.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);

  final List<MatchData> matchesDataList = [
    MatchData('leOsiak', '29.05.2021 15:00', 5),
    MatchData('Lysy', '29.05.2021 18:00', 3),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        Column(children: generateWidgets(size, matchesDataList)),
      ],
    );
  }
}

List<Widget> generateWidgets(
  Size size,
  List<MatchData> matchesDataList,
) {
  List<Widget> list = [UpperBar(size: size)];
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

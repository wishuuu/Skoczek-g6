import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/invites_screen/components/upper_bar.dart';
import 'package:skoczek_g6/screens/invites_screen/components/item_list.dart';
import 'package:skoczek_g6/data_templates.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<InviteData> invitesData = [
      InviteData('Mistrzostwa Bloku', '29.05.2021')
    ];

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
        Column(
          children: generateWidgets(size, invitesData),
        ),
      ],
    );
  }
}

List<Widget> generateWidgets(
  Size size,
  List<InviteData> invitesData,
) {
  List<Widget> list = [UpperBar(size: size)];

  for (var i = 0; i < invitesData.length; i++) {
    list.add(
      ItemList(
        size: size,
        tournamentName: invitesData[i].tournamentName,
        date: invitesData[i].date,
      ),
    );
  }

  return list;
}

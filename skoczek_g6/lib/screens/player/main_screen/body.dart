import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/player/main_screen/components/upper_bar.dart';
import 'package:skoczek_g6/screens/player/main_screen/components/button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

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
        Column(
          children: [
            UpperBar(size: size),
            Row(
              children: [
                Button(size: size, string: "Twoje partie", func: () => Navigator.pushNamed(context, '/matches')),
                Button(size: size, string: "Dołącz do turnieju")
              ],
            ),
            Row(
              children: [
                Button(size: size, string: "Oczekujące zaproszenia", func: () => Navigator.pushNamed(context, '/invites')),
                Button(size: size, string: "Analiza partii", func: () => Navigator.pushNamed(context, '/analysis')),
              ],
            ),
            Row(
              children: [
                Button(size: size, string: "Historia partii"),
                Button(size: size, string: "Ustawienia"),
              ],
            )
          ],
        ),
      ],
    );
  }
}

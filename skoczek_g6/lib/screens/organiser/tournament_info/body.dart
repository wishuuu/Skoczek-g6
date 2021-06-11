import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';

import 'package:skoczek_g6/screens/organiser/tournament_info/components/upper_bar.dart';
import 'package:skoczek_g6/constants.dart';

class Body extends StatelessWidget {
  Body({Key key, this.dbManager}) : super(key: key);
  DBManager dbManager;

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

            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "nazwa",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),

            Container(
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "data",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "miejsce",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),

            Container(
              alignment: Alignment.center,
              width: size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "liczba stolików",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
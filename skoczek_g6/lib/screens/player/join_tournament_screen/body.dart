import 'package:flutter/material.dart';

import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/screens/player/join_tournament_screen/components/upper_bar.dart';

class Body extends StatelessWidget {
  Body({Key key, this.dbManager}) : super(key: key);

  final DBManager dbManager;
  String tournamentCode = "";

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
              width: size.width * 0.9,
              margin: EdgeInsets.symmetric(vertical: 45),
              child: TextField(
                onChanged: (String input) {
                  tournamentCode = input;
                },
                style: TextStyle(color: Colors.black),
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tournament Code',
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 50,
                width: 300,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    onSurface: Colors.white,
                    backgroundColor: Colors.green[300],
                  ),
                  onPressed: () {},
                  child: Text("Dołącz do turnieju",
                      style: TextStyle(fontSize: 22)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
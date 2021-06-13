import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/main.dart';

import 'package:skoczek_g6/screens/organiser/match_finish_screen/components/upper_bar.dart';
import 'package:skoczek_g6/constants.dart';

class Body extends StatelessWidget {
  String player1 = "";
  String player2 = "";
  String moves = "";
  Body({Key key, this.dbManager}) : super(key: key);

  final DBManager dbManager;
  bool isOrganiser = true;

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
        Column(children: [
          UpperBar(size: size),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 25),
            child: TextField(
              onChanged: (String input) {
                player1 = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gracz 1',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            width: size.width * 0.9,
            child: TextField(
              onChanged: (String input) {
                player2 = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gracz 2',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            width: size.width * 0.9,
            child: TextField(
              maxLines: 12,
              onChanged: (String input) {
                moves = input;
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tu wpisz ruchy graczy.',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            child: SizedBox(
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  onSurface: Colors.white,
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, "/register",
                  //     arguments: dbManager);
                },
                child: Text('Zatwierdź', style: TextStyle(fontSize: 22)),
              ),
            ),
          )
        ]),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/main.dart';

import 'package:skoczek_g6/screens/organiser/match_finish_screen/components/upper_bar.dart';
import 'package:skoczek_g6/constants.dart';

class Body extends StatelessWidget {
  String player1 = "";
  String player2 = "";
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
          Row(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Text('Białe',
                      style: TextStyle(
                          fontSize: 22, backgroundColor: kPrimaryColor))),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  child: Text('Czarne',
                      style: TextStyle(
                          fontSize: 22, backgroundColor: kPrimaryColor))),
            ],
          ),
          Row(
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 65),
                width: size.width * 0.1,
                child: TextField(
                  onChanged: (String input) {},
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
              Container(
                width: size.width * 0.1,
                child: TextField(
                  onChanged: (String input) {},
                  style: TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            child: SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.5,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  onSurface: Colors.white,
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  //       onPressed: () async {
                  //       List<PersonEntry> moves = await Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //         builder: (context) => SOF(),
                  //       ),
                  //     );
                  // if (moves != null) moves.forEach(print);
                  // },
                },
                child: Text('Dodaj ruch', style: TextStyle(fontSize: 22)),
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: size.height * 0.06,
              width: size.width * 0.5,
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

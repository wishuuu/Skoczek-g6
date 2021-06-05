import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/organiser/create_tournament/components/upper_bar.dart';

class Body extends StatelessWidget {
  String tournamentName = "";
  String date = "";
  int numofTables = 1;
  String place = "";
  bool isOpen = true;

  Body({Key key}) : super(key: key);

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
                tournamentName = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nazwa turnieju',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 0),
            child: TextField(
              onChanged: (String input) {
                date = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Data',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 25),
            child: TextField(
              onChanged: (String input) {
                numofTables = int.parse(input);
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Liczba stolików',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            width: size.width * 0.4,
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: TextField(
              onChanged: (String input) {
                place = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Miejsce',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            child: SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  onSurface: Colors.white,
                  backgroundColor: Colors.green[300],
                ),
                onPressed: () {},
                child: Text('Stwórz turniej', style: TextStyle(fontSize: 22)),
              ),
            ),
          ),
          // Text("Turniej otwarty"),
          // Checkbox(
          //   checkColor: Colors.white,
          //   activeColor: Colors.red,
          //   value: isOpen,
          //   onChanged: (bool value){
          //     setState((){
          //       isOpen = true;
          //     }
          //     );
          //   },

          // )
        ]),
      ],
    );
  }
}

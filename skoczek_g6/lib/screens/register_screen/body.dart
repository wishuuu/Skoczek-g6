import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/register_screen/components/upper_bar.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/constants.dart';

class Body extends StatelessWidget {
  String login = "";
  String password = "";
  int ranking = 1000;
  String imie = "";
  String nazwisko = "";
  String email = "";

  DBManager dbManager;

  Body({Key key, this.dbManager}) : super(key: key);

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
                login = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Login',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 0),
            child: TextField(
              onChanged: (String input) {
                password = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Haslo',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 25),
            child: TextField(
              onChanged: (String input) {
                email = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Row(children: [
            Container(
              width: size.width * 0.4,
              margin: EdgeInsets.symmetric(
                  vertical: 0, horizontal: size.width * 0.05),
              child: TextField(
                onChanged: (String input) {
                  imie = input;
                },
                style: TextStyle(color: Colors.black),
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Imie',
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            Container(
              width: size.width * 0.4,
              margin: EdgeInsets.symmetric(
                  vertical: 0, horizontal: size.width * 0.05),
              child: TextField(
                onChanged: (String input) {
                  nazwisko = input;
                },
                style: TextStyle(color: Colors.black),
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nazwisko',
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
          ]),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 25),
            child: TextField(
              onChanged: (String input) {
                ranking = int.parse(input);
              },
              style: TextStyle(color: Colors.black),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ranking FIDE',
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
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  Future(() async => await registerFunction(context));
                },
                child: Text('Zarejestruj się', style: TextStyle(fontSize: 22)),
              ),
            ),
          )
        ]),
      ],
    );
  }

  Future<void> registerFunction(context) async {
    if (login == "" ||
        password == "" ||
        imie == "" ||
        nazwisko == "" ||
        email == "") return false;
    if (ranking == 0) ranking = 400;
    int errorCode = await dbManager.registerUser(
        login, password, ranking, imie, nazwisko, email);
    if (errorCode == 0) {
      Navigator.pop(context);
    } else if (errorCode == 1)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Rejestracja nie udana'),
            content: Text('Nazwa użytkownika zajęta'),
          );
        },
      );
    else if (errorCode == 2)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Rejestracja nie udana'),
            content: Text('Email zajęty'),
          );
        },
      );
  }
}

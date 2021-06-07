import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/main.dart';

import 'package:skoczek_g6/screens/login_screen/components/upper_bar.dart';

class Body extends StatelessWidget {
  String password = "";
  String login = "";
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
            margin: EdgeInsets.symmetric(vertical: 45),
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
            margin: EdgeInsets.symmetric(vertical: 1),
            child: TextField(
              onChanged: (String input) {
                password = input;
              },
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Haslo',
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            child: SizedBox(
              height: 50,
              width: 150,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  onSurface: Colors.white,
                  backgroundColor: Colors.green[300],
                ),
                onPressed: () {
                  Future.microtask(
                    () => loginFunction(context),
                  );
                },
                child: Text('Zaloguj się', style: TextStyle(fontSize: 22)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
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
                child: Text('Zarejestruj się', style: TextStyle(fontSize: 22)),
              ),
            ),
          )
        ]),
      ],
    );
  }

  Future<void> loginFunction(context) async {
    await dbManager.loginUser(login, password);
    isOrganiser = await dbManager.checkOrganiser();
    Navigator.pushNamed(
      context,
      isOrganiser ? '/organiser' : '/player',
      arguments: dbManager,
    );
  }
}

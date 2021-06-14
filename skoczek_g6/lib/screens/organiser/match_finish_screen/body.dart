import 'package:flutter/material.dart';
import 'package:skoczek_g6/db_manager.dart';
import 'package:skoczek_g6/main.dart';

import 'package:skoczek_g6/screens/organiser/match_finish_screen/components/upper_bar.dart';
import 'package:skoczek_g6/screens/organiser/match_finish_screen/components/item_list.dart';
import 'package:skoczek_g6/constants.dart';

class Body extends StatefulWidget {
  String moves = "";
  int winner = 0;
  bool winnerCheck = true;
  bool drawCheck = false;
  Body({Key key, this.dbManager, this.matchID}) : super(key: key);

  final DBManager dbManager;
  final int matchID;

  bool isLoadingCompleted = false;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Widget> widgetsToShow = [];
  List data = [];

  void loadData(Size size, context) {
    widget.isLoadingCompleted = true;
    Future(
      () async => {
        widgetsToShow = [UpperBar(size: size)],
        data = await widget.dbManager.readNicknames(widget.matchID),
        setState(
          () => {
            widgetsToShow.addAll(
              [
                ItemList(
                  string1: 'White:',
                  string2: data[1],
                ),
                ItemList(
                  string1: 'Black:',
                  string2: data[3],
                ),
              ],
            ),
          },
        ),
      },
    );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (!widget.isLoadingCompleted) {
      loadData(size, context);
    }
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
        UpperBar(size: size),
        Column(
          children: [
            Column(children: widgetsToShow),
            Column(
              children: [
                Container(
                  width: size.width * 0.9,
                  child: TextField(
                    maxLines: 12,
                    onChanged: (String input) {
                      widget.moves = input;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tu wpisz ruchy graczy.',
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Czy wygrał biały"),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: kPrimaryColor,
                      value: widget.winnerCheck,
                      onChanged: (bool value) {
                        setState(
                          () => {
                            widget.winnerCheck = !widget.winnerCheck,
                          },
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Remis"),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: kPrimaryColor,
                      value: widget.drawCheck,
                      onChanged: (bool value) {
                        setState(
                          () => {
                            widget.drawCheck = !widget.drawCheck,
                          },
                        );
                      },
                    ),
                  ],
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
                      onPressed: () => {
                        widget.dbManager.chooseWinner(
                            widget.matchID,
                            widget.drawCheck ? 0 : widget.winnerCheck ? data[0] : data[2],
                            widget.moves),
                        Navigator.pop(context)
                      },
                      child: Text('Zatwierdź', style: TextStyle(fontSize: 22)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

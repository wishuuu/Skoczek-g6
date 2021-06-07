import 'package:flutter/material.dart';

import 'package:skoczek_g6/screens/organiser/create_tournament/components/upper_bar.dart';
import 'package:skoczek_g6/constants.dart';

class Body extends StatefulWidget {
  String tournamentName = "";
  DateTime date = DateTime.now();
  int numofTables = 1;
  String place = "";
  bool isOpen = true;

  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                widget.tournamentName = input;
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
            child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    widget.date.toString().substring(0, 10),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                onTap: () => _selectDate(context)),
          ),
          Container(
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 25),
            child: TextField(
              onChanged: (String input) {
                widget.numofTables = int.parse(input);
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
            width: size.width * 0.9,
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: TextField(
              onChanged: (String input) {
                widget.place = input;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Turniej otwarty"),
              Checkbox(
                checkColor: Colors.black,
                activeColor: kPrimaryColor,
                value: widget.isOpen,
                onChanged: (bool value) {
                  setState(() {
                    widget.isOpen = !widget.isOpen;
                  });
                },
              ),
            ],
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
                onPressed: () {},
                child: Text('Stwórz turniej', style: TextStyle(fontSize: 22)),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: widget.date,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != widget.date)
      setState(() {
        widget.date = pickedDate;
      });
  }
}

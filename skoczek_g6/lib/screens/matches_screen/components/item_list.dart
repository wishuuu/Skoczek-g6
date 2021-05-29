import 'package:flutter/material.dart';

import 'package:skoczek_g6/constants.dart';

class ItemList extends StatelessWidget {
  const ItemList(
      {Key key,
      @required Size this.size,
      String this.opponentName,
      String this.date,
      int this.tableNumber})
      : super(key: key);

  final Size size;
  final String opponentName;
  final String date;
  final int tableNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          children: [
            Text(
              opponentName,
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
            Text(
              tableNumber.toString(),
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 6,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        width: size.width * 0.95,
        height: size.height * 0.1,
        padding: EdgeInsets.symmetric(
          vertical: size.width * 0.07,
          horizontal: size.width * 0.1,
        ),
        margin: EdgeInsets.symmetric(
          vertical: size.width * 0.03,
        ),
      ),
    );
  }
}

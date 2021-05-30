import 'package:flutter/material.dart';

import 'package:skoczek_g6/constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    @required Size this.size,
    String this.string,
    Function this.func,
  }) : super(key: key);

  final Size size;
  final String string;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Stack(alignment: Alignment.center, children: [
          Text(
            string,
            style: TextStyle(
              fontSize: 24,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            string,
            style: TextStyle(
              fontSize: 24,
              color: kTextColor,
            ),
            textAlign: TextAlign.center,
          )
        ]),
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
        width: size.width * 0.4,
        height: size.width * 0.4,
        margin: EdgeInsets.symmetric(
            vertical: size.width * 0.07, horizontal: size.width * 0.05),
      ),
      onTap: func,
    );
  }
}

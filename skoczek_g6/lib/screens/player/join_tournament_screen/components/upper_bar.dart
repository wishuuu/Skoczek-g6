import 'package:flutter/material.dart';

import 'package:skoczek_g6/constants.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({
    Key key,
    @required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          height: 0.125 * size.height,
          width: size.width,
          padding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding + 5,
          ),
          child: Stack(alignment: Alignment.center, children: [
            Text(
              "Dołącz do turnieju",
              style: TextStyle(
                fontSize: 32,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
              ),
            ),
            Text("Dołącz do turnieju",
                style: TextStyle(
                  fontSize: 32,
                  color: kTextColor,
                ))
          ]),
        ),
      ],
    );
  }
}

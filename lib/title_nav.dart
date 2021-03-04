import 'package:flutter/material.dart';

class TitleAndNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30, left: 30),
        alignment: Alignment.topLeft,
        child: Row(children: [
          Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                size: 30,
              )),
          Container(
            padding: EdgeInsets.only(left: 80),
            child: Text(
              "MEALS",
              style: TextStyle(fontSize: 30),
            ),
          )
        ]));
  }
}

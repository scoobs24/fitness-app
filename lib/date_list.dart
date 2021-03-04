import 'package:flutter/material.dart';

class DateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: 15,
        ),
        height: 200,
        width: 300,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Feb \n 21",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Feb \n 22",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Feb \n 23",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ]));
  }
}

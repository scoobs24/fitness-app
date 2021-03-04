import 'package:flutter/material.dart';

class CalorieTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Text("400", style: TextStyle(fontSize: 55)),
      ),
      Container(
        child: Text("Calories"),
      ),
    ]);
  }
}

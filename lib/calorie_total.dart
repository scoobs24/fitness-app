import 'package:flutter/material.dart';

class CalorieTotal extends StatelessWidget {
  @override
  double totalCalories;
  CalorieTotal(this.totalCalories);
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Text(totalCalories.toString(), style: TextStyle(fontSize: 55)),
      ),
      Container(
        child: Text("Calories"),
      ),
    ]);
  }
}

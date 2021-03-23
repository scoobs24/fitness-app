import 'package:flutter/material.dart';

class AddMealButton extends StatelessWidget {
  final Function startAddNewMeal;
  final Function _addNewMeal;

  AddMealButton(this._addNewMeal, this.startAddNewMeal);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 30),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => startAddNewMeal(context),
          child: Container(
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ));
  }
}

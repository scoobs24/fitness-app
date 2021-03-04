import 'package:flutter/material.dart';

class AddMealButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 30),
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => {},
          child: Container(
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ));
  }
}

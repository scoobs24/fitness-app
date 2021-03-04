import 'package:Capstone/add_mealbutton.dart';
import 'package:Capstone/meal_list.dart';
import 'package:Capstone/title_nav.dart';
import 'package:flutter/material.dart';
import 'package:Capstone/models/meal.dart';
import 'package:Capstone/calendar.dart';
import 'package:Capstone/calorie_total.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final calController = TextEditingController();

  final List<Meal> _userMeals = [
    Meal(1, "Eggs", 100.00, DateTime.now()),
    Meal(2, 'Soup', 120.00, DateTime.now()),
    Meal(3, 'MEAT', 420.00, DateTime.now()),
    Meal(4, 'Pussy', 100000.00, DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TitleAndNav(),
          MyCalendar(),
          MealList(_userMeals),
          CalorieTotal(),
          AddMealButton(),
        ],
      ),
    ));
  }
}

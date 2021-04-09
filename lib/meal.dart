import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import './calorie_total.dart';
import './models/meal.dart';
import './title_nav.dart';
import './new_meals.dart';
import './add_mealbutton.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> with TickerProviderStateMixin {
  final titleController = TextEditingController();
  final calController = TextEditingController();
  double totalCalories = 0;
  CalendarController _calendarController;
  AnimationController _animationController;
  Map<DateTime, List> _dateData;
  List _userMeals = [];
  var _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _dateData = {};
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK _onDaySelected');
    setState(() {
      if (_dateData[day] == null || _dateData[day].isEmpty) {
        _dateData[_selectedDay] = _userMeals;
        _selectedDay = day;
        _userMeals = events;
        totalCalories = 0;
      } else {
        _dateData[_selectedDay] = _userMeals;
        _userMeals = _dateData[day];
        _selectedDay = day;
        totalCalories = 0;
        addCalories();
      }
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  void _addNewMeal(String title, double calories) {
    final newMeal = Meal(title, calories, DateTime.now());
    setState(() {
      _userMeals.add(newMeal);
      totalCalories += newMeal.calories;
    });
  }

  void addCalories() {
    for (int i = 0; i <= _userMeals.length - 1; i++) {
      totalCalories += _userMeals[i].calories;
    }
  }

  void startAddNewMeal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewMeal(_addNewMeal),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Meal Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //TitleAndNav(),
              _buildTableCalendar(),
              _buildEventList(),
              CalorieTotal(totalCalories),
              AddMealButton(_addNewMeal, startAddNewMeal),
            ],
          ),
        ));
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _dateData,
      initialCalendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {
        CalendarFormat.week: "One Week",
        CalendarFormat.twoWeeks: "Two Weeks"
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventList() {
    return Container(
        alignment: Alignment.center,
        height: 350,
        child: _userMeals.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No Meals added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ],
              )
            : Container(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            elevation: 25,
                            color: Colors.white70,
                            child: Row(children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    top: 25, left: 25, right: 25, bottom: 20),
                                margin: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  'FOODPIC',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(_userMeals[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  Text('Calories:' +
                                      _userMeals[index].calories.toString()),
                                ],
                              )
                            ])));
                  },
                  itemCount: _userMeals.length,
                )));
  }
}

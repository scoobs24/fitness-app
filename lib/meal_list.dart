import 'package:flutter/material.dart';
import './models/meal.dart';

class MealList extends StatelessWidget {
  final List<Meal> meals;
  MealList(this.meals);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 350,
        child: meals.isEmpty
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
                        child: Column(children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 25,
                              color: Colors.white70,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 25,
                                        left: 25,
                                        right: 25,
                                        bottom: 20),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      'FOOD',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(meals[index].title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                      Text('Calories:'),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          )
                        ]));
                  },
                  itemCount: meals.length,
                )));
  }
}

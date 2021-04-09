import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './category_item.dart';
import './dummy_data.dart';
import './category_item.dart';
//import 'package:navagation_app/category_item.dart';
//import 'package:navagation_app/dummy_data.dart';
import './meal.dart';

class SideNavagation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Health App"),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        ),
        drawer: new Drawer(
            child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: new Text("Kyle Meredith"),
              accountEmail: new Text('kmered01@rams.shepherd.edu'),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.cyan,
                child: new Text("KM"),
              ),
              otherAccountsPictures: [
                new CircleAvatar(
                  backgroundColor: Colors.cyan,
                  child: new Text("BR"),
                ),
              ],
            ),
            ListTile(
              title: new Text("Meals"),
              trailing: new Icon(Icons.menu_book_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new MealPage()));
              },
            ),
            ListTile(
              title: new Text("Workout"),
              trailing: new Icon(Icons.fitness_center_rounded),
            ),
            ListTile(
              title: new Text("Chillout"),
              trailing: new Icon(Icons.sentiment_satisfied_rounded),
            ),
            ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.logout),
            )
          ],
        )),
        body: GridView(
          padding: const EdgeInsets.all(25),
          children: Dummy_Categories.map((categoryItem) =>
              CategoryItem(categoryItem.title, categoryItem.color)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ));
  }
}

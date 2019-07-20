import 'package:cafeteria/provider/theme_changer_provider.dart';
import 'package:cafeteria/screens/food_item_feedback_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerComponent extends StatefulWidget {
  @override
  _NavigationDrawerComponentState createState() =>
      _NavigationDrawerComponentState();
}

class _NavigationDrawerComponentState extends State<NavigationDrawerComponent> {
  bool switchOn = false;

Widget build(BuildContext context) {
  ThemeChangerProvider themeChangerProvider =
  Provider.of<ThemeChangerProvider>(context);
  return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Sukumar"),
          currentAccountPicture: CircleAvatar(child: Text("S")),
          accountEmail: Text("sukumar@gmail.com"),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Profile"),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text("Help"),
        ),
        ListTile(
          leading: Icon(Icons.lightbulb_outline),
          title: Text("Night Mode"),
          trailing: Checkbox(
              onChanged: (value) {
                setState(() {
                  switchOn = value;
                  debugPrint("$value");
                  themeChangerProvider
                      .setTheme(switchOn ? Brightness.dark : Brightness.light);
                });
              },
              value: switchOn),
        ),
        ListTile(
          leading: Icon(Icons.laptop_chromebook),
          title: Text("View All Feedback"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => FoodItemFeedbackScreen()));
          },
        ),
        Container(
          decoration: ShapeDecoration(shape: StadiumBorder()),
          padding: const EdgeInsets.all(50.0),
          child: FlatButton(
            onPressed: () {},
            child: Text("Logout"),
            color: Colors.pinkAccent,
          ),
        )
      ]));
}

}


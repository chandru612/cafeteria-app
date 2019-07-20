import 'package:cafeteria/component/food_list_component.dart';
import 'package:cafeteria/component/navigation_drawer_component.dart';
import 'package:cafeteria/models/food_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafeteria/Service/food_item_service.dart';

class FoodItemScreen extends StatefulWidget {
  @override
  FoodItemScreenState createState() => FoodItemScreenState();
}

class FoodItemScreenState extends State<FoodItemScreen> {
  List<FoodItem> foodItems = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
            future: FoodItemService.getAllFoodItems(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
              bool isSuccess = snapshot.connectionState == ConnectionState.done && snapshot.hasData;
              return isSuccess ? FoodListComponent(snapshot.data) : Center(child: CircularProgressIndicator());
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
          appBar: new AppBar(
            title: Text("Gmail App"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          drawer: NavigationDrawerComponent()),
    );
  }
}

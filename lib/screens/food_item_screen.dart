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
  final Text _title = Text("Cafeteria");

  FutureBuilder _futureBuilder() => FutureBuilder(
        future: FoodItemService.getAllFoodItems(),
        builder: (BuildContext context, AsyncSnapshot snapShot) =>
            buildBody(snapShot),
      );

  Widget buildBody(AsyncSnapshot snapShot) {
    bool isSuccess =
        snapShot.connectionState == ConnectionState.done && snapShot.hasData;
    return isSuccess
        ? FoodListComponent(snapShot.data)
        : Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _futureBuilder(),
          appBar: new AppBar(
            title: _title,
          ),
          drawer: NavigationDrawerComponent()),
    );
  }
}

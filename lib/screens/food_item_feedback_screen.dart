import 'package:cafeteria/component/food_list_feedback_component.dart';
import 'package:cafeteria/component/navigation_drawer_component.dart';
import 'package:cafeteria/service/food_item_service.dart';
import 'package:flutter/material.dart';

class FoodItemFeedbackScreen extends StatelessWidget {
  final Text _title = Text('Food Feedback');
  FutureBuilder _futureBuilder() => FutureBuilder(
    future: FoodItemService.getAllFoodItemsWithFeedback(),
    builder: (BuildContext context, AsyncSnapshot snapShot) => buildBody(snapShot),
  );

  Widget buildBody(AsyncSnapshot snapShot) {
    bool isSuccess =
          snapShot.connectionState == ConnectionState.done && snapShot.hasData;
      return isSuccess
          ? FoodListFeedbackComponent(snapShot.data)
          : Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _title,
        ),
        body: _futureBuilder(),
        drawer: NavigationDrawerComponent(),
      ),
    );
  }
}

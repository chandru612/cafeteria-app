import 'package:cafeteria/component/food_list_feedback_component.dart';
import 'package:cafeteria/component/navigation_drawer_component.dart';
import 'package:cafeteria/service/food_item_service.dart';
import 'package:flutter/material.dart';

class FoodItemFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Food Feedback'),
          ),
          body: FutureBuilder(future: FoodItemService.getAllFoodItemsWithFeedback(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            bool isSuccess = snapshot.connectionState == ConnectionState.done && snapshot.hasData;
            return isSuccess ? FoodListFeedbackComponent(snapshot.data) : Center(child: CircularProgressIndicator());
          },
          ),
        drawer: NavigationDrawerComponent(),
        ),
    );
  }
}

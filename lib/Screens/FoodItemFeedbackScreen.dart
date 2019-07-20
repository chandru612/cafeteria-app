import 'package:cafeteria/Component/FoodListFeedbackComponent.dart';
import 'package:flutter/material.dart';

import '../Component/NavigationDrawerComponent.dart';
import '../Service/FoodItemService.dart';

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

import 'package:cafeteria/models/food_item_feedback.dart';
import 'package:flutter/material.dart';

import 'feedback_stats_component.dart';

class FoodListFeedbackComponent extends StatelessWidget {

  List<FoodItemFeedback> foodItems;

  FoodListFeedbackComponent(this.foodItems);

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild list page");

    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (BuildContext context, int index) {
        var foodItem = foodItems[index];
        return ListTile(
          title: Text(foodItem.name),
          subtitle: Text(foodItem.description),
          leading: CircleAvatar(
            child: Text(
              foodItem.name[0],
            ),
          ),
          trailing: FeedbackStatsComponent(foodItem),
        );
      },
    );
  }
}

import 'package:cafeteria/models/food_item_feedback.dart';
import 'package:flutter/material.dart';

import 'Feedback_stats_component.dart';


class FoodListFeedbackComponent extends StatelessWidget {

  List<FoodItemFeedback> foodItemFeedbacks;

  FoodListFeedbackComponent(this.foodItemFeedbacks);

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild list page");

    return ListView.builder(
      itemCount: foodItemFeedbacks.length,
      itemBuilder: (BuildContext context, int index) {
        var foodItemFeedback = foodItemFeedbacks[index];
        return ListTile(
          title: Text(foodItemFeedback.name),
          subtitle: Text(foodItemFeedback.description),
          leading: CircleAvatar(
            child: Text(
              foodItemFeedback.name[0],
            ),
          ),
          trailing: FeedbackStatsComponent(foodItemFeedback),
        );
      },
    );
  }
}

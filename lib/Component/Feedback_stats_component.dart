import 'package:cafeteria/Models/food_item_feedback.dart';
import 'package:flutter/material.dart';

class FeedbackStatsComponent extends StatelessWidget {
  FoodItemFeedback foodItem;

  FeedbackStatsComponent(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            child: Text(foodItem.likes.toString()),
            radius: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text(foodItem.neutral.toString()),
            radius: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Text(foodItem.dislikes.toString()),
            radius: 10,
          ),
        ),
      ],
    );
  }
}

import 'package:cafeteria/models/food_item_feedback.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FeedbackStatsComponent extends StatelessWidget {
  FoodItemFeedback foodItemFeedback;

  FeedbackStatsComponent(this.foodItemFeedback);

  Map<String, double> parseRadii(){
    int maxValue = [foodItemFeedback.likes, foodItemFeedback.neutral, foodItemFeedback.dislikes].reduce(max);

    return {
      "green": foodItemFeedback.likes == maxValue ? 15.0 : 10.0,
      "yellow": foodItemFeedback.neutral == maxValue ? 15.0 : 10.0,
      "red": foodItemFeedback.dislikes == maxValue ? 15.0 : 10.0,
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> radiiValues = parseRadii();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            child: Text(foodItemFeedback.likes.toString()),
            radius: radiiValues["green"],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text(foodItemFeedback.neutral.toString()),
            radius: radiiValues["yellow"],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Text(foodItemFeedback.dislikes.toString()),
            radius: radiiValues["red"],
          ),
        ),
      ],
    );
  }
}

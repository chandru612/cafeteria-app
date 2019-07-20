import 'package:cafeteria/Models/FoodItemFeedback.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class FeedbackStatsComponent extends StatelessWidget {
  FoodItemFeedback foodItem;

  FeedbackStatsComponent(this.foodItem);

  Map<String, double> parseRadii(){
    int maxValue = [foodItem.likes, foodItem.neutral, foodItem.dislikes].reduce(max);

    return {
      "green": foodItem.likes == maxValue ? 15.0 : 10.0,
      "yellow": foodItem.neutral == maxValue ? 15.0 : 10.0,
      "red": foodItem.dislikes == maxValue ? 15.0 : 10.0,
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
            child: Text(foodItem.likes.toString()),
            radius: radiiValues["green"],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text(foodItem.neutral.toString()),
            radius: radiiValues["yellow"],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Text(foodItem.dislikes.toString()),
            radius: radiiValues["red"],
          ),
        ),
      ],
    );
  }
}

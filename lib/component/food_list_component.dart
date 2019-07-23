import 'package:cafeteria/models/food_item.dart';
import 'package:cafeteria/screens/food_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:feedback_widget/feedback_widget.dart';

class FoodListComponent extends StatefulWidget {
  final List<FoodItem> foodItems;

  FoodListComponent(this.foodItems);

  @override
  _FoodListComponentState createState() => _FoodListComponentState();
}

class _FoodListComponentState extends State<FoodListComponent> {
  final Map<String, Status> feedbacks = {};

  Widget _circleAvatar(String name) => Container(
        margin: const EdgeInsets.only(right: 10),
        child: CircleAvatar(
          child: Text(name[0]),
        ),
      );

  Widget _description(String name, String description) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(name),
            Text(description),
          ],
        ),
      );

  Widget _feedbackView(String name) => FeedbackView(
        listener: (Status status) {
          feedbacks[name] = status;
        },
      );

  List<Widget> _buildWidgets(int index) {
    var foodItem = widget.foodItems[index];
    return [
      _circleAvatar(foodItem.name),
      _description(foodItem.name, foodItem.description),
      _feedbackView(foodItem.name)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.foodItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildWidgets(index),
            ),
          );
        });
  }

  void goToNextPage(BuildContext context, FoodItem foodItem) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FoodDetailScreen(foodItem)));
  }
}

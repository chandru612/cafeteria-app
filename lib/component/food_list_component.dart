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
  final BoxDecoration _boxDecoration = BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)]);
  Widget _circleAvatar(String name) => Container(
        margin: const EdgeInsets.only(right: 10),
        child: CircleAvatar(
          child: Text(name[0]),
        ),
      );

  Widget _description(String name, String description) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
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
      _feedbackView(foodItem.name),
    ];
  }

  Widget _foodCell(int index) => Container(
        decoration: _boxDecoration,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildWidgets(index),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.foodItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: _foodCell(index),
          );
        });
  }

  void goToNextPage(BuildContext context, FoodItem foodItem) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FoodDetailScreen(foodItem)));
  }
}

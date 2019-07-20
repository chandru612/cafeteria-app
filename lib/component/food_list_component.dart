import 'package:cafeteria/Models/foodItem.dart';
import 'package:cafeteria/screens/food_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:feedback_widget/feedback_widget.dart';

class FoodListComponent extends StatefulWidget {

  List<FoodItem> foodItems;

  FoodListComponent(this.foodItems);

  @override
  _FoodListComponentState createState() => _FoodListComponentState();
}

class _FoodListComponentState extends State<FoodListComponent> {
  @override
  Widget build(BuildContext context) {
    debugPrint("rebuild list page");
    var feedbacks = {};
    return ListView.builder(
        itemCount: widget.foodItems.length,
        itemBuilder: (BuildContext context, int index){
          var foodItem = widget.foodItems[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  child: Text(foodItem.name[0]),
                ),
            ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(foodItem.name),
                      Text(foodItem.description)
                    ],
                  ),
                ),
                FeedbackView(
                  listener: (Status status) {
                    switch (status) {
                      case Status.LIKE:
                        feedbacks[foodItem.name] = Status.LIKE;
                      break;
                      case Status.AVERAGE:
                        feedbacks[foodItem.name] = Status.AVERAGE;
                      break;
                      case Status.UNLIKE:
                        feedbacks[foodItem.name] = Status.UNLIKE;
                    }
                  },
                )
              ],

            ),
          );

    });
  }

  void goToNextPage(BuildContext context, FoodItem foodItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailScreen()..foodItem = foodItem));
  }
}

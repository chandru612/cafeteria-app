import 'package:cafeteria/Models/FoodItem.dart';
import 'package:cafeteria/Screens/FoodDetailPage.dart';
import 'package:flutter/material.dart';

class FoodListComponent extends StatelessWidget {

  List<FoodItem> foodItems;

  FoodListComponent(this.foodItems);

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
          onTap: () {
            goToNextPage(context, foodItem);
          },
        );
      },
    );
  }

  void goToNextPage(BuildContext context, FoodItem foodItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailPage()..foodItem = foodItem));
  }
}

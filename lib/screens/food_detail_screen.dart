import 'package:cafeteria/models/food_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {

  FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(foodItem?.name),
      ),
    ));
  }
}

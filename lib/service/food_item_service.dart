import 'package:cafeteria/Models/foodItem.dart';
import 'package:cafeteria/Models/FoodItemFeedback.dart';
import "package:http/http.dart" as http;
import 'package:cafeteria/common/constants.dart';

class FoodItemService {
  static Future<List<FoodItem>> getAllFoodItems() async {
    var response = await http.get(foodItemsUrl);
    return foodItemFromJson(response.body);
  }

  static Future<List<FoodItemFeedback>> getAllFoodItemsWithFeedback() async {
    var response = await http.get(foodItemsFeedbackUrl);
    return foodItemFeedbackFromJson(response.body);
  }
}

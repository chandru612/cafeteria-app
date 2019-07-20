import 'package:cafeteria/Models/FoodItem.dart';
import "package:http/http.dart" as http;
import 'package:cafeteria/common/Constants.dart';

class FoodItemService {
  static Future<List<FoodItem>> getAllFoodItems() async {
    var response = await http.get(foodItemsUrl);
    return foodItemFromJson(response.body);
  }
}

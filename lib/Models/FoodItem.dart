import 'dart:convert';

List<FoodItem> foodItemFromJson(String str) => new List<FoodItem>.from(json.decode(str).map((x) => FoodItem.fromJson(x)));

String foodItemToJson(List<FoodItem> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class FoodItem {
    String name;
    String imageUrl;
    String description;

    FoodItem({
        this.name,
        this.imageUrl,
        this.description,
    });

    factory FoodItem.fromJson(Map<String, dynamic> json) => new FoodItem(
        name: json["name"],
        imageUrl: json["image_url"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image_url": imageUrl,
        "description": description,
    };

    /*static List<FoodItem> foodItems() {
    var foodItems = <FoodItem>[];
    foodItems.add(FoodItem("Dosa", "url", "This is a south indian dish"));
    foodItems.add(FoodItem("Idly", 2, "Idly Description"));
    foodItems.add(FoodItem("Salad", 3, "Very good for health"));
    foodItems.add(FoodItem("Nutty cream", 4, "High Quality nuts"));
    foodItems.add(FoodItem("Gulab Jamun", 5, "A treat for your taste buds"));
    foodItems.add(FoodItem("Curd Rice", 6, "Helps protect your digestive system"));

    return foodItems;
  }*/
}

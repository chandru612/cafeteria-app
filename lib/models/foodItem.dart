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
}

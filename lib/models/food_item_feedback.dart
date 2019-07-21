
import 'dart:convert';

List<FoodItemFeedback> foodItemFeedbackFromJson(String str) => new List<FoodItemFeedback>.from(json.decode(str).map((x) => FoodItemFeedback.fromJson(x)));

String foodItemFeedbackToJson(List<FoodItemFeedback> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class FoodItemFeedback {
  String name;
  String imageUrl;
  String description;
  int likes;
  int dislikes;
  int neutral;

  FoodItemFeedback({
    this.name,
    this.imageUrl,
    this.description,
    this.likes,
    this.dislikes,
    this.neutral,
  });

  factory FoodItemFeedback.fromJson(Map<String, dynamic> json) => new FoodItemFeedback(
    name: json["name"],
    imageUrl: json["image_url"],
    description: json["description"],
    likes: json["likes"],
    dislikes: json["dislikes"],
    neutral: json["neutral"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image_url": imageUrl,
    "description": description,
    "likes": likes,
    "dislikes": dislikes,
    "neutral": neutral,
  };
}

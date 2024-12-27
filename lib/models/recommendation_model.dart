import 'package:flutter/material.dart';

class RecommendationModel{
  String name;
  String iconPath;
  bool isViewed;
  String cal;
  String type;
  Color bgColor;

  RecommendationModel({
    required this.name,
    required this.iconPath,
    required this.isViewed,
    required this.cal,
    required this.type,
    required this.bgColor
  });

  static List<RecommendationModel> getRecommendations() {
    List<RecommendationModel> recommendedItems = [];
    recommendedItems.add(
      RecommendationModel(name: 'BlueBerry Cake', iconPath: 'https://raw.githubusercontent.com/mahdinazmi/Flutter-Basics/e577a3a3dc9736f233ab3ffede91b500ab325064/assets/icons/blueberry-pancake.svg', isViewed: true, cal: '123', type: 'High Carbs',bgColor: Colors.pink)
    );
    recommendedItems.add(
        RecommendationModel(name: 'Canai Bread', iconPath: 'https://raw.githubusercontent.com/mahdinazmi/Flutter-Basics/e577a3a3dc9736f233ab3ffede91b500ab325064/assets/icons/canai-bread.svg', isViewed: false, cal: '23', type: 'High Fiber',bgColor: Colors.purple)
    );
    recommendedItems.add(
        RecommendationModel(name: 'Honey Cake', iconPath: 'https://raw.githubusercontent.com/mahdinazmi/Flutter-Basics/e577a3a3dc9736f233ab3ffede91b500ab325064/assets/icons/honey-pancakes.svg', isViewed: true, cal: '56', type: 'Low Protein',bgColor: Colors.orangeAccent)
    );
    recommendedItems.add(
        RecommendationModel(name: 'Salmon', iconPath: 'https://raw.githubusercontent.com/mahdinazmi/Flutter-Basics/e577a3a3dc9736f233ab3ffede91b500ab325064/assets/icons/salmon-nigiri.svg', isViewed: false, cal: '23', type: 'High Protein', bgColor: Colors.blueGrey)
    );
    return recommendedItems;
  }
}
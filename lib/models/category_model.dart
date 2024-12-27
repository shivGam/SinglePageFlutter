import 'package:flutter/material.dart';
class CategoryModel {
  String name;
  String iconPath;
  Color bgColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.bgColor
  });

  static List<CategoryModel> getCategory() {
    List<CategoryModel> items = [];
      items.add(
          CategoryModel(name: 'Chinese', iconPath: 'https://www.reshot.com/preview-assets/icons/TWD823CXPR/chinese-food-TWD823CXPR.svg', bgColor: Colors.yellow[100] ?? Colors.yellow)
      );
      items.add(
          CategoryModel(name: 'Drinks', iconPath: 'https://www.reshot.com/preview-assets/icons/NL7GKTQJS6/pour-wine-NL7GKTQJS6.svg', bgColor: Colors.orange[100] ?? Colors.orange)
      );
      items.add(
          CategoryModel(name: 'Snacks', iconPath: 'https://www.reshot.com/preview-assets/icons/U9YN7LZAW3/food-bowl-with-lid-U9YN7LZAW3.svg', bgColor: Colors.cyan[100] ?? Colors.cyan)
      );
      items.add(
          CategoryModel(name: 'Japanese', iconPath: 'https://www.reshot.com/preview-assets/icons/DUYKGBF2XM/hot-food-DUYKGBF2XM.svg', bgColor: Colors.purple[100] ?? Colors.purple)
      );
      return items;
    }
}


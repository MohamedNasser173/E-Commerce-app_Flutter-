import 'package:flutter/cupertino.dart';

class CategoryModel {
  String name = "demo", image = "imageDemo";

  CategoryModel({required this.name, required this.image});

  CategoryModel.fromJason(Map<dynamic, dynamic> map) {
    name = map["name"];
    image = map["image"];
  }
  toJason() {
    return {
      "name": name,
      "image": image,
    };
  }
}

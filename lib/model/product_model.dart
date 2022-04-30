import 'package:flutter/material.dart';
import '../helper/extension.dart';

class productModel {
  String name = "",
      productId = "",
      image = "",
      description = "",
      size = "",
      price = "0";
  //String color = "";
  Color color = Colors.black;

  productModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.color,
      required this.size,
      required this.price,
      required this.productId});
  productModel.fromJason(Map<dynamic, dynamic> map) {
    name = map["name"];
    image = map["image"];
    description = map["description"];
    color = HexColor.fromHex(map["colors"]);
    //color = map["colors"];
    size = map["size"];
    price = map["price"];
    productId = map["productId"];
  }
  toJason() {
    return {
      "name": name,
      "image": image,
      "description": description,
      "colors": color,
      "size": size,
      "price": price,
      "productId": productId
    };
  }
}

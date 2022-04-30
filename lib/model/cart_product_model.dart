import 'package:flutter/material.dart';

import '../helper/extension.dart';

class cartProductModel {
  String name = "", image = "", price = "0", productId = "";
  int quantity = 0;

  cartProductModel(
      {required this.name,
      required this.image,
      required this.quantity,
      required this.price,
      required this.productId});
  cartProductModel.fromJason(Map<dynamic, dynamic> map) {
    name = map["name"];
    image = map["image"];
    price = map["price"];
    quantity = map["quantity"];
    productId = map["productId"];
  }
  toJason() {
    return {
      "name": name,
      "image": image,
      "price": price,
      "quantity": quantity,
      "productId": productId
    };
  }
}

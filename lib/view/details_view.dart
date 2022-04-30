import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../core/view_model/cart_view_model.dart';
import '../model/product_model.dart';

class DetailsView extends StatelessWidget {
  productModel model;
  @override
  DetailsView({required this.model});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            child: Image.network(
              model.image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontSize: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: "size",
                              ),
                              CustomText(
                                text: model.size,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: "Color",
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: model.color,
                                ),
                                height: 20,
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: "Details",
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: model.description,
                      fontSize: 18,
                      hieght: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "price",
                      fontSize: 18,
                      colur: Colors.grey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: " \$" + model.price,
                      colur: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: Get.find<CartViewModel>(),
                  builder: (controller) => Container(
                    //padding: EdgeInsets.all(8),
                    width: 125,
                    child: customButton(
                      onPressed: () {
                        controller.addProduct(cartProductModel(
                            name: model.name,
                            image: model.image,
                            quantity: 1,
                            price: model.price,
                            productId: model.productId));
                      },
                      text: 'ADD',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

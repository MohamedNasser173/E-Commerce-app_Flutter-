import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.find<CartViewModel>(), //
        builder: (controller) => Scaffold(
              body: controller.cartProductModelList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/cart_empty_SVG.svg",
                          width: 180,
                          height: 180,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Cart Empty",
                          fontSize: 25,
                          alignment: Alignment.center,
                        )
                      ],
                    ) //for cart empty
                  : Column(
                      children: [
                        Expanded(
                          child:
                              // if the cart is empty we will show svg picture
                              Container(
                            padding: const EdgeInsets.all(
                              15,
                            ),
                            child: ListView.separated(
                              itemCount: controller.cartProductModelList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 140,
                                  child: Row(
                                    children: [
                                      Image.network(
                                        controller
                                            .cartProductModelList[index].image,
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 35),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: controller
                                                  .cartProductModelList[index]
                                                  .name,
                                              fontSize: 20,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                              text:
                                                  " \$ ${controller.cartProductModelList[index].price}",
                                              colur: kPrimaryColor,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: 140,
                                              height: 40,
                                              color: Colors.grey.shade200,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    ),
                                                    onTap: () {
                                                      controller
                                                          .increamentQuantity(
                                                              index);
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  CustomText(
                                                    text: controller
                                                        .cartProductModelList[
                                                            index]
                                                        .quantity
                                                        .toString(),
                                                    fontSize: 20,
                                                    alignment: Alignment.center,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .decreseQuantity(
                                                              index);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: const Icon(
                                                        Icons.minimize,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 15,
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: "TOTAL",
                                    fontSize: 25,
                                    colur: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  GetBuilder<CartViewModel>(
                                    init: Get.find<CartViewModel>(),
                                    builder: (controller) => CustomText(
                                      text: "\$ ${controller.totalPrice}",
                                      fontSize: 25,
                                      colur: kPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 140,
                                height: 70,
                                child: customButton(
                                  onPressed: () {
                                    //Get.to(CheckOutView());
                                  },
                                  text: 'CHECKOUT',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ), //for cart view
            ));
  }
}

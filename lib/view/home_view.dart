import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'details_view.dart';

class HomeView extends StatelessWidget {
  List<String> categoriesList = <String>[
    "Man",
    "Woman",
    "Devices",
    "Gaming",
    "s",
    "s",
    "s",
    "s"
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                body: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _SearchTextFormField(),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: "Categories",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See All",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _listViewOfProducts(),
                    ],
                  ),
                ),
              ));
  }

  Widget _SearchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  child: Image.network(controller.categoryModel[index].image),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewOfProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModelList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  DetailsView(
                    model: controller.productModelList[index],
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                        height: 220,
                        child: Image.network(
                          controller.productModelList[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productModelList[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productModelList[index].description,
                      alignment: Alignment.bottomLeft,
                      colur: Colors.grey,
                      maxLine: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: controller.productModelList[index].price + " \$",
                      alignment: Alignment.bottomLeft,
                      colur: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}

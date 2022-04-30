import 'package:e_commerce/view/Authentication/login_screen.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/control_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentcreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: Text("Explore"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Image.asset(
                "images/Explore.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: Text("cart"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Image.asset(
                "images/Icon_Cart.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: Text("Account"),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Image.asset(
                "images/Path 5.png",
                fit: BoxFit.contain,
                width: 20,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
          //print(index);
        },
        elevation: 0.0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widget/custom_list_tile.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/view_model/profile_view_model.dart';
import 'Authentication/login_screen.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => controller.loading.value == true
            ? const Center(child: CircularProgressIndicator()) //untill get data
            : Scaffold(
                body: Container(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Colors.red,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: controller.userModel.pic == 'pic'
                                        ? const NetworkImage(kDefultImageAvater)
                                        : NetworkImage(controller.userModel.pic
                                            .toString()),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: controller.userModel.name.toString(),
                                    colur: Colors.black,
                                    fontSize: 20,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: controller.userModel.email.toString(),
                                    colur: Colors.black,
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        CustomListTile(
                          title: "Edit profile",
                          leadingImagePath: "image_menu_icons/edit_icon.png",
                          onPressed: () {},
                        ),
                        CustomListTile(
                          title: "Shipping Address",
                          leadingImagePath:
                              "image_menu_icons/location_icon.png",
                          onPressed: () {},
                        ),
                        CustomListTile(
                          title: "OrderHistory",
                          leadingImagePath: "image_menu_icons/Time_icon.png",
                          onPressed: () {},
                        ),
                        CustomListTile(
                          title: "Cards",
                          leadingImagePath: "image_menu_icons/Cards_icon.png",
                          onPressed: () {},
                        ),
                        CustomListTile(
                          title: "Notifications",
                          leadingImagePath:
                              "image_menu_icons/notifications_icon.png",
                          onPressed: () {},
                        ),
                        CustomListTile(
                          title: "Log out",
                          leadingImagePath: "image_menu_icons/logOut_item.png",
                          onPressed: () {
                            controller.signOut();
                            Get.offAll(LoginView());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}

/*
Center(
          child: TextButton(
            onPressed:
            child: Text(
              "sign out",
            ),
          ),
        ),
        */

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import 'package:e_commerce/view/widget/custom_text.dart';
import 'package:e_commerce/view/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'login_screen.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginView());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 10,
          left: 10,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(
                text: "sign up,",
                fontSize: 30,
                colur: Colors.black,
              ),
              const SizedBox(
                height: 30.0,
              ),
              customTextFormField(
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("error");
                  }
                },
                text: "Name",
                hint: "mohamed nasser",
              ),
              const SizedBox(
                height: 30.0,
              ),
              customTextFormField(
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("error");
                  }
                },
                text: "Email",
                hint: "example@gmail.com",
              ),
              const SizedBox(
                height: 30.0,
              ),
              customTextFormField(
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("error");
                  }
                },
                text: "password",
                hint: "************",
              ),
              const SizedBox(
                height: 40.0,
              ),
              customButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  controller.createAccountWithEmailAndPassword();
                },
                text: "SIGN Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

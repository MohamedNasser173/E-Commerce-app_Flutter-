import 'package:e_commerce/view/Authentication/second_screen.dart';
import 'package:e_commerce/view/widget/custom_button.dart';
import "package:e_commerce/view/widget/custom_text.dart";
import 'package:e_commerce/view/widget/custom_button_social.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/widget/custom_text_form_field.dart';
import 'package:get/get.dart';

import '../../core/view_model/auth_view_model.dart';
import 'signup_view.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
              TextFormField(
                
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  CustomText(
                    text: "Sign Up",
                    fontSize: 30,
                    colur: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: "sign up",
                      fontSize: 18,
                      colur: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: "sign up to continue",
                fontSize: 14,
                colur: Colors.grey,
                alignment: Alignment.topLeft,
              ),
              const SizedBox(
                height: 20.0,
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
                height: 20.0,
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
                height: 10.0,
              ),
              CustomText(
                text: "Forgot Password?",
                fontSize: 14,
                colur: Colors.black,
                alignment: Alignment.topRight,
              ),
              customButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  controller.signInWithEmailAndPassword();
                },
                text: "SIGN In",
              ),
              const SizedBox(height: 20),
              customButtonSocial(
                imagePass: "images/facebook.png",
                text: "Sign In with Facebook",
                onPressed: () {
                  controller.facebookSignInMethod();
                  /* vedio number 9
                  trying to sovle this error to use facebook signin method

                   Unhandled Exception: MissingPluginException(No implementation found for method login on channel app.meedu/flutter_facebook_auth)
                   E/flutter ( 8029): #0      MethodChannel._invokeMethod (package:flutter/src/services/platform_channel.dart:175:7)
                   */
                },
              ),
              SizedBox(
                height: 10,
              ),
              customButtonSocial(
                imagePass: "images/Google.png",
                text: "Sign In with Google",
                onPressed: () {
                  controller.googleSignInMethod();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:get/get.dart';

class secondScreen extends StatelessWidget {
  const secondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = Get.put(AuthViewModel());
    return Scaffold();
  }
}

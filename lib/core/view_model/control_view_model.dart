import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/cart_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentcreen = HomeView();

  get navigatorValue => _navigatorValue;
  get currentcreen => _currentcreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentcreen = HomeView();
        break;

      case 1:
        _currentcreen = CartView();
        break;

      case 2:
        _currentcreen = ProfileView();
        break;
    }
    update();
  }
}

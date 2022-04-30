import 'package:e_commerce/core/services/home_sevices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/category_model.dart';
import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  List<productModel> _productModelList = [];
  List<productModel> get productModelList => _productModelList;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; ++i) {
        var data = value[i].data();
        _categoryModel
            .add(CategoryModel.fromJason(data as Map<String, dynamic>));
      }
      _loading.value = false;
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeServices().getBestSelling().then((value) {
      for (int i = 0; i < value.length; ++i) {
        var data = value[i].data();
        _productModelList
            .add(productModel.fromJason(data as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
      // print(_productModelList.length);
    });
  }
}

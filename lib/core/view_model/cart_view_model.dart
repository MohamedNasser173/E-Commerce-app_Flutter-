import 'package:e_commerce/core/services/database/cart_database_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  var dbHelper = cartDatabaseHelper.dp;

  List<cartProductModel> _cartProductModelList = [];
  List<cartProductModel> get cartProductModelList => _cartProductModelList;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  CartViewModel() {
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;

    _cartProductModelList = (await dbHelper.getAllProduct())!;
    _loading.value = false;
    getTotalPrice();
    update();
  }

  addProduct(cartProductModel model) async {
    for (int i = 0; i < _cartProductModelList.length; i++) {
      if (_cartProductModelList[i].productId == model.productId) {
        return;
      }
    }

    await dbHelper.insert(model);
    getAllProduct();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModelList.length; i++) {
      _totalPrice += (double.parse(_cartProductModelList[i].price) *
          _cartProductModelList[i].quantity);
    }
    update();
  }

  increamentQuantity(int index) async {
    _cartProductModelList[index].quantity++;
    _totalPrice += (double.parse(_cartProductModelList[index].price));
    await dbHelper.updateProduct(_cartProductModelList[index]);
    update();
  }

  decreseQuantity(int index) async {
    if (_cartProductModelList[index].quantity > 0) {
      _cartProductModelList[index].quantity--;
      _totalPrice -= (double.parse(_cartProductModelList[index].price));

      await dbHelper.updateProduct(_cartProductModelList[index]);
      update();
    } // handle minus
  }
}

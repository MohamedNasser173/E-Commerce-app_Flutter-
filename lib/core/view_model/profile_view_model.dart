import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  final localStorgeData = Get.find<LocalStorgeData>();
  late UserModel _userModel;
  UserModel get userModel => _userModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getCurrentUser();
  }

  void _getCurrentUser() async {
    _loading.value = true;
    await localStorgeData.getUser.then((value) {
      _userModel = value;
    });
    _loading.value = false;
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorgeData.deleteUser();
    update();
  } //
}

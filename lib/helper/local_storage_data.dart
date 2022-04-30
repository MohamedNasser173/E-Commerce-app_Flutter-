import 'dart:convert';

import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LocalStorgeData extends GetxController {
  Future<UserModel> get getUser async => _GetUserData(); //may cased and error

  setUser(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        CASHED_USER_DATA, json.encode(userModel.tojson()));
  }

  Future<UserModel> _GetUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.getString(CASHED_USER_DATA);
    return UserModel.fromjson(json.decode(value!));
  }

  deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}

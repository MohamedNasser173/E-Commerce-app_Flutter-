import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:e_commerce/core/services/firestore_user.dart';
import '../../helper/local_storage_data.dart';
import '../../view/home_view.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password;
  String? name;
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  final LocalStorgeData localStorgeData = Get.find<LocalStorgeData>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUserData(user);
      Get.offAll(ControlView());
    });
    ;
  }

  void facebookSignInMethod() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final cre = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((user) {
      saveUserData(user);
      Get.offAll(ControlView());
    });
  }

  void signInWithEmailAndPassword() async {
    try {
      var value = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var user = await FireStoreUser().GetCurrentUser(value.user?.uid);
      setUserSharedRef(
          UserModel.fromjson(user.data() as Map<dynamic, dynamic>));
      Get.offAll(ControlView());
    } catch (e) {
      print(e);

      Get.snackbar(
        "error login account",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUserData(user);
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e);

      Get.snackbar(
        "error login account",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUserData(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user!.uid,
        email: user.user!.email.toString(),
        name: name ??
            user.user
                ?.displayName, // name if he didn't use sign with google or facebook
        pic: user.user?.photoURL ?? "pic");
    //pic:"pic");
    await FireStoreUser().addUserForFireStore(userModel);
    setUserSharedRef(userModel);
  }

  setUserSharedRef(UserModel userModel) async {
    await localStorgeData.setUser(userModel);
  }
}

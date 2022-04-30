import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constants.dart';
import 'custom_text.dart';

class customButton extends StatelessWidget {
  @override
  final String text;
  final void Function()
      onPressed; // don't forget typedef VoidCallback = void Function()
  customButton({required this.text, required this.onPressed});

  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(18)),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        colur: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}

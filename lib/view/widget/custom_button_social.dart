import 'package:flutter/material.dart';

import 'custom_text.dart';

class customButtonSocial extends StatelessWidget {
  final String imagePass, text;
  final Function() onPressed;

  customButtonSocial(
      {required this.imagePass, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(18),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Image.asset(imagePass),
          const SizedBox(
            width: 100,
          ),
          CustomText(
            text: text,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  late String title;
  late String leadingImagePath;
  late Function() onPressed;

  CustomListTile(
      {required this.title,
      required this.leadingImagePath,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: ListTile(
          title: CustomText(
            text: title,
          ),
          leading: Image.asset(leadingImagePath),
          trailing: const Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

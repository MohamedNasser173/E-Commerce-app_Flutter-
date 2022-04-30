import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color colur;
  final Alignment alignment;
  final int? maxLine;
  final double hieght;
  CustomText({
    this.text = "",
    this.fontSize = 16,
    this.colur = Colors.black,
    this.alignment = Alignment.topLeft,
    this.maxLine,
    this.hieght = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: colur,
          fontSize: fontSize,
          height: hieght,
        ),
        maxLines: maxLine,
      ),
    );
  }
}

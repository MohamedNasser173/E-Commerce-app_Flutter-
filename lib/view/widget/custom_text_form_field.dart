import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class customTextFormField extends StatelessWidget {
  final String text;
  final String hint;
  var onSave;
  var validator;

  customTextFormField({
    Key? key,
    required this.onSave,
    required this.text,
    required this.hint,
    required this.validator,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            colur: Colors.grey.shade900,
            alignment: Alignment.topLeft,
          ),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

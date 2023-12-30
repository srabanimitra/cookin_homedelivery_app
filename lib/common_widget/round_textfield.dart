
import 'package:cookinapp_01/common/color_extension.dart';
import 'package:flutter/material.dart';
//import 'package:cookin/common/color_extention.dart/color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hinText;
  final TextInputType? keyboardtype;
  final bool obscureText;

  const RoundTextfield(
      {super.key,
        required this.hinText,
        this.controller,
        this.keyboardtype,
        this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: TColor.textfield, borderRadius: BorderRadius.circular(25)),
        child: TextField(
          autocorrect: false,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hinText,
              hintStyle: TextStyle(
                color: TColor.placeholder,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
        ));
  }
}

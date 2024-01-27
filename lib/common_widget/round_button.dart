//import 'package:cookin01/common/color_extension.dart';
import 'package:cookinapp_01/common/color_extension.dart';
import 'package:flutter/material.dart';
//import '../common/color_extension.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  final double fontSize;
  //final double fontSize;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontSize = 16,
      this.type = RoundButtonType.bgPrimary,
      required bool loading});
  //this.fontSize = 16,
  //this.type = RoundButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: TColor.primary,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: TColor.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

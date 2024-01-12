//import 'package:cookin01/common/color_extension.dart';
import 'package:cookinapp_01/common/color_extension.dart';
import 'package:flutter/material.dart';
//import '../common/color_extension.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  //final double fontSize;
  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.type = RoundButtonType.bgPrimary,
  });
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
              color: TColor.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

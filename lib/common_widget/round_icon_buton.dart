
import 'package:cookinapp_01/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String icon;
  final Color color;
  const RoundIconButton(
      {super.key,
        required this.title,
        required this.icon,
        required this.color,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color, //0xff367FC0
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            icon,
            width: 13,
            height: 13,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(
                color: TColor.white, fontSize: 13, fontWeight: FontWeight.w600),
          )
        ]),
      ),
    );
  }
}

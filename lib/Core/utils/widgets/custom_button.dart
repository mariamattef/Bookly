import 'package:booklyapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final String? text;
  final Color? color;
  final double? fontSize;
  const CustomButton(
      {this.borderRadius,
      this.backgroundColor,
      super.key,
      this.text,
      this.fontSize,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
        ),
        onPressed: () {},
        child: Text(
          '$text',
          style: Styles.textStyle16.copyWith(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

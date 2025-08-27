import 'package:flutter/material.dart';

class FeaturePill extends StatelessWidget {
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final double textFontSize;
  final FontWeight textFontWeight;
  const FeaturePill(
      {super.key,
      required this.text,
      this.horizontalPadding = 16,
      this.verticalPadding = 8,
      this.borderRadius = 20,
      this.textFontSize = 14,
      this.textFontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          color: Colors.white,
        ),
      ),
    );
  }
}

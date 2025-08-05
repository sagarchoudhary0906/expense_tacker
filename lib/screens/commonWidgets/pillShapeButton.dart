import 'package:flutter/material.dart';

import '../../core/utility/util.dart';

class PillShapeButton extends StatelessWidget {
  final Color color;
  final double borderRadius;
  final double height;
  final double width;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final Widget child;

  const PillShapeButton(
      {super.key,
      required this.color,
      required this.borderRadius,
      required this.height,
      required this.width,
      required this.shadowColor,
      required this.shadowBlurRadius,
      required this.shadowOffset,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.getHeightValueInPixels(height),
      width: Util.getWidthValueInPixels(width),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: Util.getWidthValueInPixels(shadowBlurRadius),
            offset: shadowOffset,
          ),
        ],
      ),
      child: child,
    );
  }
}

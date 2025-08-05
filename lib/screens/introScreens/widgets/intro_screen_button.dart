import 'package:expense_tracker/screens/commonWidgets/pillShapeButton.dart';
import 'package:flutter/material.dart';

class IntroScreenButton extends StatelessWidget {
  final double bottomShift;
  final double leftShift;
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final double borderRadius;
  final Widget child;

  const IntroScreenButton({
    super.key,
    required this.bottomShift,
    required this.leftShift,
    required this.width,
    required this.height,
    required this.color,
    required this.shadowColor,
    required this.shadowBlurRadius,
    required this.shadowOffset,
    required this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottomShift,
      left: leftShift,
      child: PillShapeButton(
        height: height,
        width: width,
        color: color,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
        shadowBlurRadius: shadowBlurRadius,
        shadowOffset: shadowOffset,
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utility/util.dart';

class SecondIntroText extends StatelessWidget {
  final double topShift;
  final double leftShift;
  final double width;
  final double height;
  final List<String> textArray;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const SecondIntroText({
    super.key,
    required this.topShift,
    required this.leftShift,
    required this.width,
    required this.height,
    required this.textArray,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topShift,
      left: leftShift,
      child: SizedBox(
        height: height,
        width: width,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: textArray
                .map((text) => Text(text,
                    style: TextStyle(
                      fontSize: Util.getWidthValueInPixels(fontSize),
                      fontWeight: fontWeight,
                      color: color,
                    )))
                .toList(),
          ),
        ),
      ),
    );
  }
}

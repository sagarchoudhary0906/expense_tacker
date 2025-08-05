import 'package:flutter/material.dart';

import '../../../core/utility/util.dart';
import 'top_curve_clipper.dart';

class ColorfulClipper extends StatelessWidget {
  final String color;
  const ColorfulClipper({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopCurveClipper(),
      child: Opacity(
        opacity: 0.5,
        child: Container(
          height: Util.getFullScreenHeight() * 0.5,
          decoration: BoxDecoration(
            color: Util.getColorForHex(color),
          ),
        ),
      ),
    );
  }
}

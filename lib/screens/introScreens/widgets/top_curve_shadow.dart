import 'package:flutter/material.dart';

import '../../../core/utility/util.dart';
import 'top_curve_clipper.dart';

class TopCurveShadow extends StatelessWidget {
  const TopCurveShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      clipper: TopCurveClipper(),
      color: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black,
      child: Container(
        height: Util.getFullScreenHeight() * 0.5,
      ),
    );
  }
}

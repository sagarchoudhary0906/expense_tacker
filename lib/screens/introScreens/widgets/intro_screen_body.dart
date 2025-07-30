import 'package:flutter/material.dart';

import '../../../core/utility/constants.dart';
import '../../../core/utility/util.dart';

// Intro Screen Body Bg
Widget introScreenBodyBg() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Util.getColorForHex(Constants.HEXA773C1),
          Util.getColorForHex(Constants.HEXFFD9CB),
        ],
      ),
    ),
  );
}



import 'package:flutter/material.dart';

class Util {
  static Color getColorForHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  /// Returns the extra top safe area height (e.g., status bar, notch, dynamic island)
  static double getTopSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Returns the extra bottom safe area height (e.g., home indicator area)
  static double getBottomSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static Widget getSpacer(double dimension, bool isVertical) {
    if (isVertical) {
      return SizedBox(
        height: dimension,
      );
    }
    return SizedBox(
      width: dimension,
    );
  }

  static Widget getTopSafeAreaSpacer(BuildContext context) {
    return getSpacer(getTopSafeAreaHeight(context), true);
  }
}

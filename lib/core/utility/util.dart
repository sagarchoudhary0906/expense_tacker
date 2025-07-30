import 'package:expense_tracker/core/utility/device_info.dart';
import 'package:flutter/material.dart';

class Util {
  static const double _referenceScreenHeight = 926.0;
  static const double _referenceScreenWidth = 428.0;

  static Color getColorForHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  /// Returns the extra top safe area height (e.g., status bar, notch, dynamic island)
  static double getTopSafeAreaHeight() {
    return DeviceInfo.instance.devicePaddingTop;
  }

  /// Returns the extra bottom safe area height (e.g., home indicator area)
  static double getBottomSafeAreaHeight() {
    return DeviceInfo.instance.devicePaddingBottom;
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

  static Widget getTopSafeAreaSpacer() {
    return getSpacer(getTopSafeAreaHeight(), true);
  }

  static double getFullScreenHeight() {
    return DeviceInfo.instance.screenHeight;
  }

  static double getFullScreenWidth() {
    return DeviceInfo.instance.screenWidth;
  }

  /// Converts fixed pixel values to responsive positions based on screen size
  /// This ensures consistent positioning across different device sizes
  ///
  /// [fixedPixels] - The fixed pixel value you want to convert (e.g., 300)
  ///
  /// Returns a responsive position value that maintains visual consistency
  static double getHeightValueInPixels(double fixedPixels) {
    // Get screen dimensions
    final double screenHeight = DeviceInfo.instance.screenHeight;
    // Use a reference screen height (e.g., iPhone 14 Pro height: 844)
    // You can adjust this reference height based on your design

    // Calculate responsive position
    // This maintains the same visual proportion across different screen sizes
    return (fixedPixels / _referenceScreenHeight) * screenHeight;
  }

  /// Alternative method using screen width for horizontal positioning
  static double getWidthValueInPixels(double fixedPixels) {
    final double screenWidth = DeviceInfo.instance.screenWidth;

    return (fixedPixels / _referenceScreenWidth) * screenWidth;
  }
}

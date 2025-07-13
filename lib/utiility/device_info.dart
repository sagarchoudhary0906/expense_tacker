import 'package:flutter/material.dart';

/// Singleton class to store device dimensions once at app startup
class DeviceInfo {
  static DeviceInfo? _instance;
  static DeviceInfo get instance => _instance ??= DeviceInfo._internal();

  DeviceInfo._internal();

  double? _screenHeight;
  double? _screenWidth;
  double? _devicePaddingTop;
  double? _devicePaddingBottom;

  /// Initialize device dimensions (call this once at app startup)
  void initialize(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    _devicePaddingTop = MediaQuery.of(context).padding.top;
    _devicePaddingBottom = MediaQuery.of(context).padding.bottom;
  }

  /// Get stored screen height
  double get screenHeight => _screenHeight ?? 0.0;

  /// Get stored screen width
  double get screenWidth => _screenWidth ?? 0.0;

  /// Get stored device padding top
  double get devicePaddingTop => _devicePaddingTop ?? 0.0;

  /// Get stored device padding bottom
  double get devicePaddingBottom => _devicePaddingBottom ?? 0.0;
}

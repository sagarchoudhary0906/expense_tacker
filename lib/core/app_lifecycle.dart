import 'package:expense_tracker/core/appData/expense_data.dart';
import 'package:flutter/widgets.dart';

typedef LifecycleAsyncCallback = Future<void> Function();

/// AppLifecycle: centralized app lifecycle handler using AppLifecycleListener.
/// Attach once during bootstrap and provide callbacks as needed.
class AppLifecycle {
  AppLifecycle._();

  static AppLifecycleListener? _listener;

  static void attach({
    LifecycleAsyncCallback? onResume,
    LifecycleAsyncCallback? onPause,
    LifecycleAsyncCallback? onInactive,
    LifecycleAsyncCallback? onDetach,
  }) {
    _listener?.dispose();
    _listener = AppLifecycleListener(
      onResume: () async {},
      onInactive: () async {
        ExpenseData.saveData();
      },
      onPause: () async {},
      onDetach: () async {},
    );
  }

  static void detach() {
    _listener?.dispose();
    _listener = null;
  }

  static void handleAppLifecycle() {
    attach(
      onPause: () async {},
      onDetach: () async {},
    );
  }
}

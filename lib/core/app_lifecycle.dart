import 'package:flutter/widgets.dart';
import 'package:expense_tracker/localDataStorage/jsonStore.dart';

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
        final db = await JsonStore.readDb();
        final data = Map<String, dynamic>.from(db['data'] as Map? ?? {});
        db['data'] = data;
        await JsonStore.saveDb(db);
      },
      onPause: () async {
        final db = await JsonStore.readDb();
        final data = Map<String, dynamic>.from(db['data'] as Map? ?? {});
        db['data'] = data;
        await JsonStore.saveDb(db);
      },
      onDetach: () async {
      },
    );
  }

  static void detach() {
    _listener?.dispose();
    _listener = null;
  }

  static void handleAppLifecycle() {
    attach(
      onPause: () async {
      },
      onDetach: () async {},
    );
  }
}

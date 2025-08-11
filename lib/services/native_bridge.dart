import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // for debugPrint

/// NativeBridge: Generic, bi-directional bridge between Flutter and Android.
/// Channels:
/// - MethodChannel: request/response; also used by Android to call back into Flutter.
/// - EventChannel: continuous native -> Flutter events.
/// - BasicMessageChannel: simple messages either direction (string based).
class NativeBridge {
  static const MethodChannel _method = MethodChannel('app/native/methods');
  static const EventChannel _events = EventChannel('app/native/events');
  static const BasicMessageChannel<String> _messages =
      BasicMessageChannel<String>('app/native/messages', StringCodec());

  // Flutter -> Android: generic execute(action, args)
  static Future<T?> execute<T>(String action,
      {Map<String, dynamic>? args}) async {
    return _method.invokeMethod<T>('execute', {
      'action': action,
      'args': args ?? <String, dynamic>{},
    });
  }

  // Flutter -> Android: direct method name, if you want explicit methods
  static Future<T?> invoke<T>(String method,
      [Map<String, dynamic>? args]) async {
    return _method.invokeMethod<T>(method, args);
  }

  // Android -> Flutter: stream of events
  static Stream<dynamic> get eventStream => _events.receiveBroadcastStream();

  // Android -> Flutter: call a Flutter handler by method name
  static void setMethodCallHandler(
      Future<dynamic> Function(MethodCall call)? handler) {
    _method.setMethodCallHandler(handler);
  }

  // Messages (string based)
  static void setMessageHandler(
      Future<String> Function(String? message)? handler) {
    _messages.setMessageHandler(handler);
  }

  static Future<void> sendMessage(String message) async {
    await _messages.send(message);
  }

  // Sends a one-shot request from Flutter -> Android and returns a String result.
  // Native side handles the "ping" case in AppNativeBridge.onMethodCall(...).
  // Tip: Call NativeBridge.registerNativeCallbacks() early (e.g., in main()) so
  // Android->Flutter callbacks are ready when native responds.
  static Future<String?> pingNative(
      [String message = "hello-from-flutter"]) async {
    debugPrint('AppNativeBridge: pingNative() called from flutter $message');
    // Under the hood this uses MethodChannel('app/native/methods').invokeMethod('ping', ...)
    final res = await invoke<String>('ping', {'message': message});
    return res; // e.g., "pong-from-android: <message>"
  }

  static Future<String?> makeNativeCall(String functionName,
      [String message = "hello-from-flutter"]) async {
    debugPrint(
        'AppNativeBridge: makenative call() called from flutter $message');
    final res = await invoke<String>(functionName, {'message': message});
    return res;
  }

  // Convenience helper to log any Android -> Flutter events coming via EventChannel.
  // Use when you expect continuous native streams (sensors, broadcasts, etc.).
  static StreamSubscription<dynamic> logEvents() =>
      eventStream.listen((e) => debugPrint('Flutter: event -> $e'));

  // Registers a MethodChannel handler so Android can call a Flutter method by name.
  // MUST be registered early (e.g., in main() before runApp) to catch callbacks.
  // Native calls this via: methodChannel.invokeMethod("pingFromAndroid", payload)
  static void registerNativeCallbacks() {
    // Install a single handler to process all native -> Flutter method calls.
    NativeBridge.setMethodCallHandler((call) async {
      // The method/action name provided by native (String)
      final action = call.method;

      // call.arguments is platform-encoded dynamic; we expect a Map payload.
      // Safely coerce to a Map<String, dynamic>. If it's not a Map, use an empty one.
      final raw = call.arguments;
      final Map<String, dynamic> args =
          raw is Map ? Map<String, dynamic>.from(raw) : <String, dynamic>{};

      if (action == 'pingFromAndroid') {
        // Return null to indicate no value to send back to native.
        return null;
      }

      // Unknown/unhandled method: return null to avoid throwing on native side.
      return null;
    });
  }
}

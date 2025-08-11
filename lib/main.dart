import 'package:flutter/material.dart';

import 'core/utility/device_info.dart';
import 'screens/introScreens/intro_screen_first_v1.dart';
import 'services/native_bridge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NativeBridge.registerNativeCallbacks(); // must be BEFORE native invokes
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Initialize device dimensions once at app startup
    DeviceInfo.instance.initialize(context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreenFirstV1(),
    );
  }
}

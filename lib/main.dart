import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/app_lifecycle.dart';
import 'core/utility/device_info.dart';
import 'localDataStorage/jsonStore.dart';
import 'screens/introScreens/intro_screen_first_v1.dart';
import 'services/native_bridge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NativeBridge.registerNativeCallbacks(); // must be BEFORE native invokes
  await Firebase.initializeApp();
  await JsonStore.init(); // creates db.json if missing
  AppLifecycle.handleAppLifecycle();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // MediaQuery is available here
        DeviceInfo.instance.initialize(context);
        return child!;
      },
      home: const IntroScreenFirstV1(),
    );
  }
}

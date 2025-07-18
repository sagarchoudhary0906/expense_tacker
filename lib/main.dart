import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/login_screen_v1/login_screen.dart';
import 'utiility/device_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: LoginScreenV1(),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/login_screen_v1/login_screen.dart';
import 'utiility/device_info.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

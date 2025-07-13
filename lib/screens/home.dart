import 'package:flutter/material.dart';
import '../utiility/constants.dart';
import '../utiility/strings.dart';
import '../utiility/util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.appName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Util.getColorForHex(
            Constants.hex_fefae0), // Green background for the AppBar
        elevation: 0, // Optional: removes AppBar shadow for a flat look
      ),
      backgroundColor: Util.getColorForHex(Constants.hex_fefae0),
      body: const SizedBox.expand(), // Fills the screen with empty space
    );
  }
}

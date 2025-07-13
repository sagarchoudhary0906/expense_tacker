import 'package:flutter/material.dart';

import '../../utiility/constants.dart';
import '../../utiility/util.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _backgroundWidget(),
        _loginScreenWalletIconWidget(),
      ],
    );
  }

  Widget _backgroundWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Util.getColorForHex(
                Constants.hex_52b69a), // Replace with your top green
            Colors.black, // Replace with your bottom green
          ],
        ),
      ),
    );
  }

  Widget _loginScreenWalletIconWidget() {
    return Transform.translate(
      offset: Offset(
          0, Util.getHeightValueInPixels(-200)), // Move up by 60 design pixels
      child: Container(
        height: Util.getHeightValueInPixels(125),
        width: Util.getWidthValueInPixels(125),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(Constants.loginScreenWalletIcon),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utiility/constants.dart';
import '../../utiility/strings.dart';
import '../../utiility/util.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.getColorForHex(
          Constants.HEX_fefae0), // Green background for the AppBar
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Safe Area Widget
        Util.getTopSafeAreaSpacer(context),
        // Enmpty Spacer
        Util.getSpacer(50, true),
        // Wallet Image Container
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(Constants.loginScreenWalletIcon),
          ),
        ),
        //Empty Spacer
        Util.getSpacer(30, true),
        // Adding Login or Sign Up Text
        Text(
          Strings.loginOrSignUp,
          style: TextStyle(
              fontSize: 30, color: Util.getColorForHex(Constants.HEX_1A1110)),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utiility/constants.dart';
import '../../utiility/strings.dart';
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
        _signUpOrSignIntextWidget(),
        _signUpFbOptionsWidget(),
        _signUpGoogleOptionsWidget(),
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
            Util.getColorForHex(Constants.hex_52b69a),
            Colors.black,
          ],
        ),
      ),
    );
  }

  Widget _loginScreenWalletIconWidget() {
    return Transform.translate(
      offset: Offset(0, Util.getHeightValueInPixels(-200)),
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

  Widget _signUpOrSignIntextWidget() {
    return Text(
      Strings.signUpBelowToCreateAsecureAccount,
      style: GoogleFonts.roboto(
          fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  Widget _signUpFbOptionsWidget() {
    return Transform.translate(
      offset: Offset(
          Util.getWidthValueInPixels(-60), Util.getHeightValueInPixels(120)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Util.getWidthValueInPixels(60),
            height: Util.getHeightValueInPixels(60),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Constants.fbLogoIcon),
            ),
          ),
          Util.getSpacer(8, true),
          Text(
            Strings.facebook,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpGoogleOptionsWidget() {
    return Transform.translate(
      offset: Offset(
          Util.getWidthValueInPixels(60), Util.getHeightValueInPixels(120)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Util.getWidthValueInPixels(60),
            height: Util.getHeightValueInPixels(60),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Constants.googleLogoIcon),
            ),
          ),
          Util.getSpacer(8, true),
          Text(
            Strings.google,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

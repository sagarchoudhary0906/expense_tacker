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
        _continueAsGuestWidget(),
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
        offset: Offset(0, Util.getHeightValueInPixels(120)),
        child: Container(
          height: Util.getHeightValueInPixels(40),
          width: Util.getHeightValueInPixels(250),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Util.getColorForHex(Constants.hex_52b69a),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Util.getSpacer(10, false),
              Container(
                  width: Util.getWidthValueInPixels(32),
                  height: Util.getHeightValueInPixels(32),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset(
                      Constants.fbLogoIcon,
                    ),
                  )),
              Util.getSpacer(10, false),
              Text(
                Strings.continueWithFacebook,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textScaler: const TextScaler.linear(1.0),
              ),
            ],
          ),
        ));
  }

  Widget _signUpGoogleOptionsWidget() {
    return Transform.translate(
        offset: Offset(0, Util.getHeightValueInPixels(180)),
        child: Container(
          height: Util.getHeightValueInPixels(40),
          width: Util.getHeightValueInPixels(230),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Util.getColorForHex(Constants.hex_52b69a),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Util.getSpacer(10, false),
              Container(
                  width: Util.getWidthValueInPixels(32),
                  height: Util.getHeightValueInPixels(32),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset(
                      Constants.googleLogoIcon,
                    ),
                  )),
              Util.getSpacer(10, false),
              Text(
                Strings.continueWithGoogle,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textScaler: const TextScaler.linear(1.0),
              ),
            ],
          ),
        ));
  }

  Widget _continueAsGuestWidget() {
    return Transform.translate(
        offset: Offset(0, Util.getHeightValueInPixels(235)),
        child: Container(
          height: Util.getHeightValueInPixels(35),
          width: Util.getHeightValueInPixels(200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Util.getColorForHex(Constants.hex_52b69a),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            Strings.continueAsGuest,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textScaler: const TextScaler.linear(1.0),
          ),
        ));
  }
}

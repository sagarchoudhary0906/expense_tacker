import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utiility/constants.dart';
import '../../utiility/strings.dart';
import '../../utiility/util.dart';

class LoginScreenV1 extends StatefulWidget {
  const LoginScreenV1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenV1State();
  }
}

class _LoginScreenV1State extends State<LoginScreenV1> {
  String email = '';
  String password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.getColorForHex(Constants.hex_f8f7ff),
      body: _loginScreenBody(),
    );
  }

  Widget _loginScreenBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Util.getWidthValueInPixels(50),
        ),
        Expanded(
          child: _mainBodyWidget(),
        ),
        Container(
          width: Util.getWidthValueInPixels(50),
        ),
      ],
    );
  }

  Widget _mainBodyWidget() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Bezel Top Safe Area Widget
        Container(
          height: Util.getTopSafeAreaHeight(),
          color: Colors.white,
        ),
        Expanded(
          // <-- This makes the green container fill the remaining space
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Util.getSpacer(
                  Util.getHeightValueInPixels(10), true), // Empty Spacer
              _backIconWidget(),
              Util.getSpacer(
                  Util.getHeightValueInPixels(20), true), // Empty Spacer
              _loginTextWidget(),
              _loginSubTextWidget(),
              Util.getSpacer(
                  Util.getHeightValueInPixels(40), true), // Empty Spacer
              _emailContainer(),
              Util.getSpacer(
                  Util.getHeightValueInPixels(40), true), // Empty Spacer
              _passwordConatiner(),
              Util.getSpacer(
                  Util.getHeightValueInPixels(40), true), // Empty Spacer
              _loginButton(),
              Util.getSpacer(
                  Util.getHeightValueInPixels(20), true), // Empty Spacer
              _horizontalLineWidget(),
              Util.getSpacer(
                  Util.getHeightValueInPixels(20), true), // Empty Spacer
              _googleLoginWidget(),
              Util.getSpacer(
                  Util.getHeightValueInPixels(40), true), // Empty Spacer
              _registerWidget(),
            ],
          ),
        ),
        // Bezel Bottom Safe Area Widget
        Container(
          height: Util.getBottomSafeAreaHeight(),
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _backIconWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.arrow_back, // Default back arrow icon
        color: Colors.black, // You can change the color if needed
        size: 30, // You can change the size if needed
      ),
    );
  }

  Widget _loginTextWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        Strings.login,
        style: GoogleFonts.roboto(
            color: Util.getColorForHex(Constants.hex_1F41BB),
            fontSize: Util.getHeightValueInPixels(35),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _loginSubTextWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      child: FittedBox(
          child: Text(
        Strings.loginNowToTrackAllYourExpenses,
        style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: Util.getHeightValueInPixels(15),
            fontWeight: FontWeight.w500),
      )),
    );
  }

  Widget _emailContainer() {
    double paddingLeftValue = Util.getWidthValueInPixels(10);
    return Container(
      alignment: Alignment.centerLeft,
      height: Util.getHeightValueInPixels(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.email,
              style: GoogleFonts.roboto(
                  color: Util.getColorForHex(Constants.hex_1F41BB),
                  fontSize: Util.getHeightValueInPixels(15),
                  fontWeight: FontWeight.w500)),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                  Util.getHeightValueInPixels(17),
                ),
                color: Util.getColorForHex(Constants.hex_1F41BB),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    Util.getHeightValueInPixels(16),
                  ),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: Strings.enterYouremail,
                    border: InputBorder.none,
                    isCollapsed: true, // This removes extra vertical padding
                    contentPadding: EdgeInsets.only(left: paddingLeftValue),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordConatiner() {
    double paddingLeftValue = Util.getWidthValueInPixels(10);
    return Container(
      alignment: Alignment.centerLeft,
      height: Util.getHeightValueInPixels(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.password,
              style: GoogleFonts.roboto(
                  color: Util.getColorForHex(Constants.hex_1F41BB),
                  fontSize: Util.getHeightValueInPixels(15),
                  fontWeight: FontWeight.w500)),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                  Util.getHeightValueInPixels(17),
                ),
                color: Util.getColorForHex(Constants.hex_1F41BB),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                    Util.getHeightValueInPixels(16),
                  ),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: Strings.enterYourPass,
                    border: InputBorder.none,
                    isCollapsed: true, // This removes extra vertical padding
                    contentPadding: EdgeInsets.only(left: paddingLeftValue),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      alignment: Alignment.center,
      height: Util.getHeightValueInPixels(60),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
        color: Util.getColorForHex(Constants.hex_1F41BB),
      ),
      child: Text(
        Strings.login,
        style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: Util.getHeightValueInPixels(20),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _horizontalLineWidget() {
    return Container(
      height: Util.getHeightValueInPixels(1),
      color: Colors.black,
    );
  }

  Widget _googleLoginWidget() {
    return Container(
      alignment: Alignment.center,
      height: Util.getHeightValueInPixels(60),
      padding: EdgeInsets.all(Util.getHeightValueInPixels(1)),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(17)),
          color: Colors.black),
      child: Container(
        alignment: Alignment.center,
        height: Util.getHeightValueInPixels(60),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius:
                BorderRadius.circular(Util.getHeightValueInPixels(16)),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              child: Image.asset(Constants.googleLogoIcon),
            ),
            Text(
              Strings.continueWithGoogle,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: Util.getHeightValueInPixels(20),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(),
        Text(
          Strings.dontHaveAnAccount,
          style: GoogleFonts.roboto(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Util.getSpacer(Util.getWidthValueInPixels(5), false),
        Text(
          Strings.register,
          style: GoogleFonts.roboto(
            color: Util.getColorForHex(Constants.hex_1F41BB),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: Util.getColorForHex(Constants.hex_1F41BB),
          ),
        ),
      ],
    );
  }
}

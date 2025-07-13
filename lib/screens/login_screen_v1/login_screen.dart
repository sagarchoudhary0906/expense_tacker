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
      backgroundColor: Colors.white,
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
          color: Colors.white,
        ),
        Expanded(
          child: _mainBodyWidget(),
        ),
        Container(
          width: Util.getWidthValueInPixels(50),
          color: Colors.white,
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
              Util.getSpacer(10, true), // Empty Spacer
              _backIconWidget(),
              Util.getSpacer(20, true), // Empty Spacer
              _loginTextWidget(),
              _loginSubTextWidget(),
              Util.getSpacer(40, true), // Empty Spacer
              _emailContainer(),
              Util.getSpacer(40, true), // Empty Spacer
              _passwordConatiner(),
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
            color: Util.getColorForHex(Constants.hec_1F41BB),
            fontSize: 35,
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
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
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
                  color: Util.getColorForHex(Constants.hec_1F41BB),
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                color: Util.getColorForHex(Constants.hec_1F41BB),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
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
                  color: Util.getColorForHex(Constants.hec_1F41BB),
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                color: Util.getColorForHex(Constants.hec_1F41BB),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
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
}

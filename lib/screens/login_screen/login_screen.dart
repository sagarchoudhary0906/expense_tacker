import 'package:flutter/material.dart';

import '../../utiility/constants.dart';
import '../../utiility/util.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.getColorForHex(
          Constants.HEX_B9D9EB), // Green background for the AppBar
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    final double screenHeight = Util.getFullScreenHeight();
    const double loginBoxHeight = 400;
    final double loginDetailAreaWidgetTopPos =
        screenHeight * 0.5 - loginBoxHeight / 2;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(),
        _topHalfContainer(),
        Positioned(
          top: loginDetailAreaWidgetTopPos,
          child: _loginDetailsAreaWidget(),
        ),
      ],
    );
  }

  Widget _topHalfContainer() {
    Color topContainerColor = Util.getColorForHex(Constants.HEX_0047AB);
    return Container(
      width: double.infinity,
      height: Util.getFullScreenHeight() / 2,
      decoration: BoxDecoration(
        color: topContainerColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }

  Widget _loginDetailsAreaWidget() {
    return Container(
      width: 300, // set your desired width
      height: 400, // set your desired height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // rounded edges
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(
                (0.2 * 255).toInt()), // shadow color, replaces withOpacity
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

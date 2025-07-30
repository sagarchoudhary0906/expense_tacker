import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/util.dart';

class IntroScreenV1 extends StatelessWidget {
  const IntroScreenV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Util.getColorForHex(Constants.HEXA773C1),
              Util.getColorForHex(Constants.HEXFFD9CB),
            ],
          ),
        ),
        child: Stack(
          children: [
            PhysicalShape(
              clipper: TopCurveClipper(),
              color: Colors.green,
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                height: Util.getFullScreenHeight() * 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: isActive ? 12 : 10,
      height: isActive ? 12 : 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white38,
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.85);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.85,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

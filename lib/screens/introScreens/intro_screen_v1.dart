import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';

class IntroScreenV1 extends StatelessWidget {
  const IntroScreenV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: Util.getFullScreenHeight(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Util.getColorForHex(Constants.HEXFFB1b1),
                    Util.getColorForHex(Constants.HEXB684C3)
                  ],
                ),
              ),
            ),
            PhysicalShape(
              clipper: TopCurveClipper(),
              color: Colors.transparent,
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                height: Util.getFullScreenHeight() * 0.5,
              ),
            ),
            // Gradient layer using ClipPath
            ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: Util.getFullScreenHeight() * 0.5,
                decoration: BoxDecoration(
                  color:
                      Util.getColorForHex(Constants.HEXA773C1).withOpacity(0.5),
                ),
              ),
            ),

            // Adding First Intro Screen Text
            Positioned(
              top: Util.getFullScreenHeight() * 0.5,
              left: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(175 / 2)),
              child: SizedBox(
                height: Util.getHeightValueInPixels(48),
                width: Util.getWidthValueInPixels(175),
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.sayHiToYourNew,
                          style: TextStyle(
                            fontSize: Util.getWidthValueInPixels(20),
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          Strings.financeTracker,
                          style: TextStyle(
                            fontSize: Util.getWidthValueInPixels(20),
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
            ),

            Positioned(
              top: (Util.getFullScreenHeight() * 0.5) +
                  (Util.getHeightValueInPixels(80)),
              left: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(285 / 2)),
              child: SizedBox(
                height: Util.getHeightValueInPixels(60),
                width: Util.getWidthValueInPixels(285),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.youAreAmazingForTakingThisFirstStep,
                        style: TextStyle(
                          fontSize: Util.getWidthValueInPixels(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Strings.towardsGettingBetterControlOverYour,
                        style: TextStyle(
                          fontSize: Util.getWidthValueInPixels(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Strings.moneyAndFinancialGoals,
                        style: TextStyle(
                          fontSize: Util.getWidthValueInPixels(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
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

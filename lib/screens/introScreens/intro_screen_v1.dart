import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';

class IntroScreenV1 extends StatelessWidget {
  const IntroScreenV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Background gradient
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
            // Top curve shadow
            PhysicalShape(
              clipper: TopCurveClipper(),
              color: Colors.transparent,
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                height: Util.getFullScreenHeight() * 0.5,
              ),
            ),
            // Top curve gradient overlay
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

            // Main title text
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
                  ),
                ),
              ),
            ),

            // Subtitle/description text
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
            ),

            // Progress Dots (refactored to use _buildDot)
            Positioned(
              top: (Util.getFullScreenHeight() * 0.5) +
                  (Util.getHeightValueInPixels(165)),
              left: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(76 / 2)),
              child: SizedBox(
                height: Util.getHeightValueInPixels(12),
                width: Util.getWidthValueInPixels(76),
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First dot is active, others are inactive
                      // This can be made dynamic if needed
                      // e.g., pass an index or state
                      _Dot(isActive: true),
                      _Dot(isActive: false),
                      _Dot(isActive: false),
                    ],
                  ),
                ),
              ),
            ),

            // Adding Intro Screen Button
            Positioned(
              bottom: Util.getHeightValueInPixels(136),
              left: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(277 / 2)),
              child: SizedBox(
                width: Util.getWidthValueInPixels(277),
                height: Util.getHeightValueInPixels(46),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          Util.getWidthValueInPixels(52.5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 4, // Softness of the shadow
                          offset: Offset(0, 4), // Position of the shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        Strings.getStarted,
                        style: TextStyle(
                          fontSize: Util.getWidthValueInPixels(16),
                          fontWeight: FontWeight.w700,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Util.getColorForHex(Constants.HEXFFB1b1),
                                Util.getColorForHex(Constants.HEXB684C3)
                              ], // your gradient colors
                            ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Private widget for a single dot, for clarity and reusability
class _Dot extends StatelessWidget {
  final bool isActive;
  const _Dot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: Util.getWidthValueInPixels(12),
      height: Util.getHeightValueInPixels(12),
      decoration: isActive
          ? const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // filled circle
            )
          : BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // ring color
                width: Util.getWidthValueInPixels(2), // ring thickness
              ),
              color: Colors.transparent, // ring with transparent center
            ),
    );
  }
}

/// Custom clipper for the top curve
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

import 'package:expense_tracker/screens/introScreens/widgets/intro_screen_button.dart';
import 'package:expense_tracker/screens/introScreens/widgets/second_into_texrt.dart';
import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';
import '../commonWidgets/pillShapeButton.dart';
import 'widgets/colorful_clipper.dart';
import 'widgets/first_intro_text.dart';
import 'widgets/gradient_bg.dart';
import 'widgets/intro_screen_dots.dart';
import 'widgets/top_curve_shadow.dart';

class IntroScreenFirstV1 extends StatelessWidget {
  const IntroScreenFirstV1({super.key});

  /// First Intro Screen CTA Widget
  Widget _getStartedCtaChildWidget() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          // TODO: ADD LOGIC FUNCTIONALITY HERE
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                    ],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            /**
             * Adding Gradinet Background
             */
            const GradientBg(
              color1: Constants.HEXFFB1b1,
              color2: Constants.HEXB684C3,
              isTopToBottom: true,
            ),
            /**
             * Top curve shadow
             */
            const TopCurveShadow(),
            /**
             *  Top curve gradient overlay
             */
            const ColorfulClipper(color: Constants.HEXA773C1),
            /**
             * First Intro Text (Main Title)
             */
            FirstIntroText(
              topShift: Util.getFullScreenHeight() * 0.5,
              leftShift: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(175 / 2)),
              width: Util.getWidthValueInPixels(175),
              height: Util.getHeightValueInPixels(48),
              textArray: const [Strings.sayHiToYourNew, Strings.financeTracker],
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),

            /**
             * Second Intro Text (Subtitle/description text)
             */
            SecondIntroText(
              topShift: (Util.getFullScreenHeight() * 0.5) +
                  (Util.getHeightValueInPixels(80)),
              leftShift: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(285 / 2)),
              width: Util.getWidthValueInPixels(285),
              height: Util.getHeightValueInPixels(60),
              textArray: const [
                Strings.youAreAmazingForTakingThisFirstStep,
                Strings.towardsGettingBetterControlOverYour,
                Strings.moneyAndFinancialGoals
              ],
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),

            /**
             * Adding Screen Identifer Dots
             */
            IntroScreenDots(
              topShift: (Util.getFullScreenHeight() * 0.5) +
                  (Util.getHeightValueInPixels(165)),
              leftShift: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(76 / 2)),
              width: Util.getWidthValueInPixels(76),
              height: Util.getHeightValueInPixels(30),
              isActiveList: const [true, false, false],
              activeColor: Colors.white,
            ),

            /**
             * Adding Intro Screen Button
             */
            IntroScreenButton(
              bottomShift: Util.getHeightValueInPixels(136),
              leftShift: Util.getFullScreenWidth() * 0.5 -
                  (Util.getWidthValueInPixels(277 / 2)),
              width: Util.getWidthValueInPixels(277),
              height: Util.getHeightValueInPixels(48),
              color: Colors.white,
              shadowColor: Colors.black26,
              shadowBlurRadius: Util.getWidthValueInPixels(4),
              shadowOffset: const Offset(0, 4),
              borderRadius: Util.getWidthValueInPixels(52.5),
              child: _getStartedCtaChildWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

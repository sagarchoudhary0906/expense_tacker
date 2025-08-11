import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';
import '../../services/native_bridge.dart';
import 'intro_screen_second_v1.dart';
import 'widgets/colorful_clipper.dart';
import 'widgets/first_intro_text.dart';
import 'widgets/gradient_bg.dart';
import 'widgets/intro_screen_dots.dart';
import 'widgets/top_curve_shadow.dart';
import 'widgets/intro_screen_button.dart';
import 'widgets/second_into_texrt.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreenFirstV1 extends StatelessWidget {
  const IntroScreenFirstV1({super.key});

  /// First Intro Screen CTA Widget
  Widget _getStartedCtaChildWidget(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          NativeBridge.makeNativeCall("ping", "Hello From Flutter for the first time");
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const IntroScreenSecondV1(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween = Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // start offscreen right
                  end: Offset.zero, // end at center
                ).chain(CurveTween(curve: Curves.easeInOut));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(milliseconds: 300),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Center(
            child: Text(
              Strings.getStarted.toUpperCase(),
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

  Widget _firstIntroTextWidget() {
    return FirstIntroText(
      topShift: Util.getFullScreenHeight() * 0.5,
      leftShift: Util.getFullScreenWidth() * 0.5 -
          (Util.getWidthValueInPixels(175 / 2)),
      width: Util.getWidthValueInPixels(175),
      height: Util.getHeightValueInPixels(48),
      textArray: const [Strings.takeControlOfYourMoney, Strings.yourWay],
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  Widget _secondIntroTextWidget() {
    return SecondIntroText(
      topShift: (Util.getFullScreenHeight() * 0.5) +
          (Util.getHeightValueInPixels(80)),
      leftShift: Util.getFullScreenWidth() * 0.5 -
          (Util.getWidthValueInPixels(285 / 2)),
      width: Util.getWidthValueInPixels(285),
      height: Util.getHeightValueInPixels(60),
      textArray: const [
        Strings.welcomeToYourPersonalFinanceTracker,
        Strings.hereToMakeManagingYourMoney,
        Strings.simpleClearAndStressFree
      ],
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  Widget _introScreenDotsWidget() {
    return IntroScreenDots(
      topShift: (Util.getFullScreenHeight() * 0.5) +
          (Util.getHeightValueInPixels(165)),
      leftShift: Util.getFullScreenWidth() * 0.5 -
          (Util.getWidthValueInPixels(76 / 2)),
      width: Util.getWidthValueInPixels(76),
      height: Util.getHeightValueInPixels(30),
      isActiveList: const [true, false, false],
      activeColor: Colors.white,
    );
  }

  Widget _introScreenButtonWidget(BuildContext context) {
    return IntroScreenButton(
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
      child: _getStartedCtaChildWidget(context),
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
            _firstIntroTextWidget(),
            /**
             * Second Intro Text (Subtitle/description text)
             */
            _secondIntroTextWidget(),
            /**
             * Adding Screen Identifer Dots
             */
            _introScreenDotsWidget(),
            /**
             * Adding Intro Screen Button
             */
            _introScreenButtonWidget(context),
          ],
        ),
      ),
    );
  }
}

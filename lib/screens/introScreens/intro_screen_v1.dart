import 'package:expense_tracker/animations/pulse_scale_anim.dart';
import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';
import '../introScreens/widgets/feature_pills.dart';
import 'widgets/page_indicators.dart';

class IntroScreenV1 extends StatelessWidget {
  const IntroScreenV1({super.key});
  static const int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Util.getFullScreenWidth(),
        height: Util.getFullScreenHeight(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Util.getColorForHex(Constants.HEXFF2563EB),
              Util.getColorForHex(Constants.HEXFF1D4ED8),
              Util.getColorForHex(Constants.HEXFF6B21A8),
            ],
          ),
        ),
        child: Stack(
          children: [
            _getBackgroundImage(),
            _getMainBodyWidgets(),
          ],
        ),
      ),
    );
  }

  // Backgrund image widget
  Widget _getBackgroundImage() {
    return Positioned.fill(
        child: Opacity(
      opacity: 0.2,
      child: Image.asset(
        Constants.bgImage,
        fit: BoxFit.cover,
      ),
    ));
  }

  Widget _getMainBodyWidgets() {
    Widget mainBodyWidgets;
    mainBodyWidgets = SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(32)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            _getAppLogo(),
            SizedBox(height: Util.getHeightValueInPixels(32)),
            // App Name
            _getAppNameWidget(),
            SizedBox(height: Util.getHeightValueInPixels(16)),
            // Tagline
            _getTaglineWidget(),
            SizedBox(height: Util.getHeightValueInPixels(48)),
            //Feature Pills
            _getFeaturePills(),
            SizedBox(height: Util.getHeightValueInPixels(64)),
            // Get Started Button
            _getGetStartedButton(),
            const Spacer(),
            const PageIndicators(currentPage: currentPageIndex, totalPages: 3),
          ],
        ),
      ),
    );
    return mainBodyWidgets;
  }

  Widget _getAppLogo() {
    return Container(
      width: Util.getWidthValueInPixels(96),
      height: Util.getHeightValueInPixels(96),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(24)),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Center(
        child: Container(
          width: Util.getWidthValueInPixels(48),
          height: Util.getHeightValueInPixels(48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(Util.getHeightValueInPixels(16)),
          ),
          child: Icon(
            Icons.attach_money,
            color: Util.getColorForHex(Constants.HEXFF3B82F6),
            size: Util.getWidthValueInPixels(28),
          ),
        ),
      ),
    );
  }

  Widget _getAppNameWidget() {
    return Text(
      Constants.appName,
      style: TextStyle(
        color: Colors.white,
        fontSize: Util.getWidthValueInPixels(Constants.HEADLINE_1_SIZE),
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _getTaglineWidget() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(16.0)),
      child: Text(
        Strings.first_intro_scren_tagline,
        style: TextStyle(
          fontSize: Util.getWidthValueInPixels(Constants.HEADLINE_2_SIZE),
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 1.6,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getFeaturePills() {
    return Wrap(
      spacing: Util.getWidthValueInPixels(12),
      runSpacing: Util.getHeightValueInPixels(12),
      alignment: WrapAlignment.center,
      children: const [
        FeaturePill(
            text: Strings.smart_tracking,
            horizontalPadding: 16,
            verticalPadding: 8,
            borderRadius: 20,
            textFontSize: 14,
            textFontWeight: FontWeight.w500),
        FeaturePill(
            text: Strings.budget_goals,
            horizontalPadding: 16,
            verticalPadding: 8,
            borderRadius: 20,
            textFontSize: 14,
            textFontWeight: FontWeight.w500),
        FeaturePill(
            text: Strings.analytics,
            horizontalPadding: 16,
            verticalPadding: 8,
            borderRadius: 20,
            textFontSize: 14,
            textFontWeight: FontWeight.w500)
      ],
    );
  }

  Widget _getGetStartedButton() {
    Widget buttonWidget = SizedBox(
      width: Util.getWidthValueInPixels(288),
      height: Util.getHeightValueInPixels(56),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("Get Started Button Pressed");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Util.getColorForHex(Constants.HEXFF2563EB),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Util.getHeightValueInPixels(16)),
          ),
          elevation: 0,
        ),
        child: Text(
          Strings.getStarted,
          style: TextStyle(
            fontSize: Util.getWidthValueInPixels(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
    return PulseScale(child: buttonWidget);
  }
}

import 'package:flutter/material.dart';

import '../../animations/pulse_scale_anim.dart';
import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';
import 'widgets/feature_card.dart';
import 'widgets/page_indicators.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});
  static const int currentPageIndex = 2;

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
            Util.getColorForHex(Constants.HEXFF3B82F6),
            Util.getColorForHex(Constants.HEXFF2563EB),
            Util.getColorForHex(Constants.HEXFF7C3AED),
          ],
        ),
      ),
      child: _getBody(),
    ));
  }

  Widget _getBody() {
    return Stack(
      children: [
        // Backgroud pattern
        _getBgPattern(),
        // Feature Screen Image
        _getContent(),
      ],
    );
  }

  Widget _getBgPattern() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.1,
        child: Stack(
          children: [
            Positioned(
              top: Util.getHeightValueInPixels(80),
              right: Util.getWidthValueInPixels(32),
              child: Container(
                width: Util.getWidthValueInPixels(128),
                height: Util.getHeightValueInPixels(128),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: Util.getHeightValueInPixels(160),
              left: Util.getWidthValueInPixels(48),
              child: Container(
                width: Util.getWidthValueInPixels(96),
                height: Util.getHeightValueInPixels(96),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getContent() {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(32)),
        child: Column(
          children: [
            SizedBox(height: Util.getHeightValueInPixels(32)),

            // Hero Image
            _getHeroImage(),
            SizedBox(height: Util.getHeightValueInPixels(32)),

            // Title
            _getTitleWidget(),
            SizedBox(height: Util.getHeightValueInPixels(16)),

            // Description
            _getDescriptionWidget(),
            SizedBox(height: Util.getHeightValueInPixels(32)),

            // Features List
            _getFeaturesList(),
            SizedBox(height: Util.getHeightValueInPixels(50)),

            // Continue Button
            _getContinueButton(),

            const Spacer(),

            const PageIndicators(currentPage: currentPageIndex, totalPages: 3),
          ],
        ),
      ),
    );
  }

  Widget _getHeroImage() {
    return Container(
      width: Util.getWidthValueInPixels(250),
      height: Util.getHeightValueInPixels(154),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Util.getWidthValueInPixels(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Util.getWidthValueInPixels(24)),
        child: Image.asset(
          Constants.featureScreenImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getTitleWidget() {
    return Text(
      Strings.feature_screen_headline,
      style: TextStyle(
        fontSize: Util.getHeightValueInPixels(18.0),
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.3,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _getDescriptionWidget() {
    return Text(
      Strings.feature_screen_description,
      style: TextStyle(
        fontSize: Util.getHeightValueInPixels(13.0),
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _getFeaturesList() {
    return Column(
      children: [
        const FeatureCard(
          icon: Icons.receipt_long,
          title: Strings.feature_screen_first_feature_title,
          description: Strings.feature_screen_first_feature_description,
        ),
        SizedBox(height: Util.getHeightValueInPixels(24)),
        const FeatureCard(
          icon: Icons.account_balance_wallet,
          title: Strings.feature_screen_second_feature_title,
          description: Strings.feature_screen_second_feature_description,
        ),
        SizedBox(height: Util.getHeightValueInPixels(24)),
        const FeatureCard(
          icon: Icons.trending_up,
          title: Strings.feature_screen_third_feature_title,
          description: Strings.feature_screen_third_feature_description,
        ),
      ],
    );
  }

  Widget _getContinueButton() {
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
          Strings.continue_text,
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

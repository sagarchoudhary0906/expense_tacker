import 'package:expense_tracker/animations/pulse_scale_anim.dart';
import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';
import 'widgets/page_indicators.dart';
import 'widgets/stat_items.dart';

class GetStartedScreen extends StatelessWidget {
  static const int currentPageIndex = 3;
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getScaffoledBody());
  }

  Widget _getScaffoledBody() {
    return Container(
      width: Util.getFullScreenWidth(),
      height: Util.getFullScreenHeight(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Util.getColorForHex(Constants.HEXFF1D4ED8),
            Util.getColorForHex(Constants.HEXFF7C3AED),
            Util.getColorForHex(Constants.HEXFF6B21A8),
          ],
        ),
      ),
      child: Stack(
        children: [
          _getBgpatterns(),
          _getMainContent(),
        ],
      ),
    );
  }

  Widget _getBgpatterns() {
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

  Widget _getMainContent() {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(32)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Hero Image
            _getHeroImage(),
            SizedBox(height: Util.getHeightValueInPixels(32)),

            //Title
            _getTitle(),
            SizedBox(height: Util.getHeightValueInPixels(24)),

            //Description
            _getDescription(),
            SizedBox(height: Util.getHeightValueInPixels(32)),

            // Stats Widgets
            _getStatsWidget(),
            SizedBox(height: Util.getHeightValueInPixels(48)),

            // Buttons
            _getCta(),
            SizedBox(height: Util.getHeightValueInPixels(24)),

            // Terms and Privacy Policy
            _getTermsAndPrivacyPolicy(),
            const Spacer(),

            const PageIndicators(currentPage: currentPageIndex, totalPages: 3),
            SizedBox(height: Util.getHeightValueInPixels(10)),
          ],
        ),
      ),
    );
  }

  Widget _getHeroImage() {
    return Container(
      width: Util.getWidthValueInPixels(320),
      height: Util.getHeightValueInPixels(200),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: Util.getHeightValueInPixels(20),
              offset: const Offset(0, 10),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(24)),
        child: Image.asset(
          Constants.getStartedScreenImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      Strings.get_started_screen_title,
      style: TextStyle(
        fontSize: Util.getHeightValueInPixels(30),
        fontWeight: FontWeight.bold,
        color: Colors.white,
        height: 1.3,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _getDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(16)),
      child: Text(
        Strings.get_started_screen_description,
        style: TextStyle(
          fontSize: Util.getHeightValueInPixels(18),
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 1.6,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getStatsWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatItems(number: "50K+", label: "Happy Users"),
        StatItems(number: "\$2M+", label: "Money Saved"),
        StatItems(number: "4.8★", label: "App Rating"),
      ],
    );
  }

  Widget _getCta() {
    return Column(
      children: [
        SizedBox(
          width: Util.getWidthValueInPixels(288),
          height: Util.getHeightValueInPixels(56),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Util.getColorForHex(Constants.HEXFF7C3AED),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Util.getHeightValueInPixels(16)),
              ),
              elevation: 8,
            ),
            child: Text(
              Strings.continueAsGuest,
              style: TextStyle(
                fontSize: Util.getHeightValueInPixels(18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: Util.getHeightValueInPixels(16)),
        PulseScale(
            child: SizedBox(
          width: Util.getWidthValueInPixels(288),
          height: Util.getHeightValueInPixels(56),
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Util.getColorForHex(Constants.HEXFF7C3AED),
              side: BorderSide(
                color: Colors.white.withOpacity(0.4),
                width: Util.getWidthValueInPixels(2),
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Util.getHeightValueInPixels(16)),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Constants.googleLogoIcon, // 'assets/images/google_logo.png'
                  height: Util.getHeightValueInPixels(20),
                ),
                SizedBox(width: Util.getWidthValueInPixels(8)),
                Text(
                  Strings.continueWithGoogle,
                  style: TextStyle(
                    fontSize: Util.getHeightValueInPixels(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _getTermsAndPrivacyPolicy() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(16)),
      child: Text(
        Strings.get_started_screen_terms_and_privacy_policy,
        style: TextStyle(
          fontSize: Util.getHeightValueInPixels(12),
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.7),
          height: 1.6,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

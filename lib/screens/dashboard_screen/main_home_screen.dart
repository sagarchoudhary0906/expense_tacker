import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  static const int _homeIndex = 0;
  static const int _addIndex = 1;
  static const int _analyticsIndex = 2;
  static const int _profileIndex = 3;
  static const int _settingsIndex = 4;

  late final PageController _pageController;
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
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
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Util.getWidthValueInPixels(32)),
          child: Column(
            children: [
              // Content Area
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _selectedIndex.value = index;
                  },
                  children: [Container()],
                ),
              ),
              // Bottom Navigation
              _getBottomNavigationBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.2)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, Strings.home, _homeIndex),
                _buildNavItem(Icons.add, Strings.add, _addIndex),
                _buildNavItem(
                    Icons.bar_chart, Strings.analytics, _analyticsIndex),
                _buildNavItem(Icons.person, Strings.profile, _profileIndex),
                _buildNavItem(Icons.settings, Strings.settings, _settingsIndex),
              ],
            ),
          ),
          SizedBox(
            width: Util.getFullScreenWidth(),
            height: Util.getBottomSafeAreaHeight(),
          )
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, selected, _) {
        final isSelected = selected == index;
        return GestureDetector(
          onTap: () {
            if (_selectedIndex.value != index) {
              _selectedIndex.value = index;
              _pageController.jumpToPage(index);
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected)
                Container(
                  width: Util.getWidthValueInPixels(4),
                  height: Util.getHeightValueInPixels(4),
                  margin: const EdgeInsets.only(bottom: 4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()..scale(isSelected ? 1.1 : 1.0),
                child: Icon(
                  icon,
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                  size: Util.getWidthValueInPixels(24),
                ),
              ),
              SizedBox(height: Util.getWidthValueInPixels(4)),
              Text(
                label,
                style: TextStyle(
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utility/util.dart';

class IntroScreenDots extends StatelessWidget {
  final double topShift;
  final double leftShift;
  final double width;
  final double height;
  final List<bool> isActiveList;
  final Color activeColor;

  const IntroScreenDots({
    super.key,
    required this.topShift,
    required this.leftShift,
    required this.width,
    required this.height,
    required this.isActiveList,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topShift,
      left: leftShift,
      child: SizedBox(
        height: height,
        width: width,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Dot(isActive: isActiveList[0], width: width, height: height),
              _Dot(isActive: isActiveList[1], width: width, height: height),
              _Dot(isActive: isActiveList[2], width: width, height: height),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  final double width;
  final double height;

  const _Dot({
    required this.isActive,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: width,
      height: height,
      decoration: isActive
          ? const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // filled circle
            )
          : BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // ring color
                width: Util.getWidthValueInPixels(4), // ring thickness
              ),
              color: Colors.transparent, // ring with transparent center
            ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/utility/constants.dart';
import '../../../core/utility/util.dart';

class PageIndicators extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  const PageIndicators({
    super.key,
    required this.currentPage,
    this.totalPages = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Util.getWidthValueInPixels(12),
      runSpacing: Util.getHeightValueInPixels(12),
      alignment: WrapAlignment.center,
      children: List.generate(totalPages, (i) {
        final isActive = (i + 1) == currentPage; // 1-based
        final size = Util.getHeightValueInPixels(12);
        return Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.white : Colors.transparent,
            border: isActive
                ? null
                : Border.all(
                    color: Colors.white, width: Util.getWidthValueInPixels(2)),
          ),
        );
      }),
    );
  }
}

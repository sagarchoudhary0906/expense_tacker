import 'package:flutter/material.dart';

import '../../../core/utility/util.dart';

class StatItems extends StatelessWidget {
  final String number;
  final String label;

  const StatItems({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: Util.getHeightValueInPixels(24),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: Util.getHeightValueInPixels(4)),
        Text(
          label,
          style: TextStyle(
            fontSize: Util.getHeightValueInPixels(14),
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}

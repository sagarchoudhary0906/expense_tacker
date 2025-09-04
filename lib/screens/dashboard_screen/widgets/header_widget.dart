import 'package:flutter/material.dart';

import '../../../core/utility/profile_data.dart';
import '../../../core/utility/util.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String greetingText = Util.getGreetingText();
    String userName = ProfileData.getUserName();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greetingText,
              style: TextStyle(
                fontSize: Util.getWidthValueInPixels(24),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              userName,
              style: TextStyle(
                fontSize: Util.getWidthValueInPixels(16),
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            // Addung Profile Icon Place holder
          ],
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white.withOpacity(0.8)),
          ),
          //TODO: SAGAR ADD PROFILE IMAGE HERE
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

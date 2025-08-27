import 'package:flutter/material.dart';

import '../../../core/utility/util.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Util.getWidthValueInPixels(10)),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Util.getWidthValueInPixels(16)),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: Util.getWidthValueInPixels(1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: Util.getWidthValueInPixels(30),
            height: Util.getHeightValueInPixels(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius:
                  BorderRadius.circular(Util.getWidthValueInPixels(10)),
            ),
            child: Icon(icon,
                color: Colors.white, size: Util.getHeightValueInPixels(20)),
          ),
          SizedBox(width: Util.getWidthValueInPixels(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Util.getHeightValueInPixels(16),
                        fontWeight: FontWeight.w600)),
                SizedBox(height: Util.getHeightValueInPixels(4)),
                Text(description,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: Util.getHeightValueInPixels(14),
                        fontWeight: FontWeight.w400,
                        height: 1.5)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

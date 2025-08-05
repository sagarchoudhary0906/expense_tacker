import 'package:flutter/material.dart';

import '../../../core/utility/util.dart';

class GradientBg extends StatelessWidget {
  final String color1;
  final String color2;
  final bool isTopToBottom;
  const GradientBg(
      {super.key,
      required this.color1,
      required this.color2,
      required this.isTopToBottom});

  @override
  Widget build(BuildContext context) {
    Alignment begin =
        isTopToBottom ? Alignment.topCenter : Alignment.centerLeft;
    Alignment end =
        isTopToBottom ? Alignment.bottomCenter : Alignment.centerRight;
    return Container(
      height: Util.getFullScreenHeight(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [Util.getColorForHex(color1), Util.getColorForHex(color2)],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/util.dart';

class GetStartedScreen extends StatelessWidget {
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
        ));
  }
}

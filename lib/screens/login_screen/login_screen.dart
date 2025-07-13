import 'package:flutter/material.dart';

import '../../utiility/constants.dart';
import '../../utiility/util.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _bodyWidget(),
          // ...rest of your widgets (sign up text, buttons, etc.)
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return buildTopImageSection();
  }

  Widget buildTopImageSection() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Util.getColorForHex(
                Constants.hex_52b69a), // Replace with your top green
            Colors.black, // Replace with your bottom green
          ],
        ),
      ),
    );
  }

//   Widget _topHalfContainer() {
//     Color topContainerColor = Util.getColorForHex(Constants.HEX_0047AB);
//     return Container(
//       width: double.infinity,
//       height: Util.getFullScreenHeight() / 2,
//       decoration: BoxDecoration(
//         color: topContainerColor,
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(32),
//           bottomRight: Radius.circular(32),
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _loginDetailsAreaWidget() {
//     return Container(
//       width: 300, // set your desired width
//       height: 400, // set your desired height
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20), // rounded edges
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withAlpha(
//                 (0.2 * 255).toInt()), // shadow color, replaces withOpacity
//             spreadRadius: 2,
//             blurRadius: 10,
//             offset: const Offset(0, 4), // changes position of shadow
//           ),
//         ],
//       ),
//     );
//   }
}

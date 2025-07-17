import 'package:flutter/material.dart';

import '../../utiility/constants.dart';
import '../../utiility/util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String password = '';
  String name = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Util.getColorForHex(Constants.hex_f8f7ff),
      body: _registerScreenBody(),
    );
  }

  Widget _registerScreenBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Util.getWidthValueInPixels(50),
        ),
        Expanded(
          child: _mainBodyWidget(),
        ),
        Container(
          width: Util.getWidthValueInPixels(50),
        ),
      ],
    );
  }

  Widget _mainBodyWidget() {
    return Column(
      children: [
        // Bezel Top Safe Area Widget
        Container(
          height: Util.getTopSafeAreaHeight(),
          color: Colors.white,
        ),
      ],
    );
  }
}

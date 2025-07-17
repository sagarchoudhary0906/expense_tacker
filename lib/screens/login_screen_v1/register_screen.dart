import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utiility/constants.dart';
import '../../utiility/strings.dart';
import '../../utiility/util.dart';
import '../commonWidgets/common_widgets.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // Cached colors and styles for better performance
  late final Color _brandColor;
  late final Color _backgroundColor;
  late final TextStyle _titleStyle;
  late final TextStyle _labelStyle;
  late final TextStyle _bodyStyle;
  late final TextStyle _buttonTextStyle;

  @override
  void initState() {
    super.initState();
    _initializeStyles();
  }

  void _initializeStyles() {
    _brandColor = Util.getColorForHex(Constants.hex_1F41BB);
    _backgroundColor = Util.getColorForHex(Constants.hex_f8f7ff);

    _titleStyle = GoogleFonts.roboto(
      color: _brandColor,
      fontSize: Util.getHeightValueInPixels(35),
      fontWeight: FontWeight.w500,
    );

    _labelStyle = GoogleFonts.roboto(
      color: _brandColor,
      fontSize: Util.getHeightValueInPixels(15),
      fontWeight: FontWeight.w500,
    );

    _bodyStyle = GoogleFonts.roboto(
      color: Colors.black,
      fontSize: Util.getHeightValueInPixels(15),
      fontWeight: FontWeight.w500,
    );

    _buttonTextStyle = GoogleFonts.roboto(
      color: Colors.white,
      fontSize: Util.getHeightValueInPixels(20),
      fontWeight: FontWeight.w500,
    );
  }

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
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(50)),
          child: _mainContent(),
        ),
      ),
    );
  }

  Widget _mainContent() {
    return Column(
      children: [
        // Bezel Top Safe Area Widget
        SizedBox(height: Util.getHeightValueInPixels(10)),
        CommonWidgets.backButtonWidget(),
        SizedBox(height: Util.getHeightValueInPixels(20)),
        _registerTextWidget(),
        _registerSubTextWidget(),
        SizedBox(height: Util.getHeightValueInPixels(40)),
        CommonWidgets.emailContainer(
            _emailController, _labelStyle, _brandColor),
        SizedBox(height: Util.getHeightValueInPixels(30)),
        CommonWidgets.passwordContainer(
            _passwordController, _labelStyle, _brandColor),
        SizedBox(height: Util.getHeightValueInPixels(30)),
        CommonWidgets.addYourNameContainer(
            _nameController, _labelStyle, _brandColor),
        SizedBox(height: Util.getHeightValueInPixels(50)),
        _registerButton(),
        SizedBox(height: Util.getHeightValueInPixels(20)),
        CommonWidgets.horizontalLineWidget(),
        SizedBox(height: Util.getHeightValueInPixels(20)),
        _alreadyHaveAccountLoginWidget()
      ],
    );
  }

  Widget _registerTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(Strings.register, style: _titleStyle),
    );
  }

  Widget _registerSubTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: Strings.createAnAccountToAccessAllTheFeaturesOf,
              style: _bodyStyle,
            ),
            TextSpan(
              text: Strings.expenseTracker,
              style: _bodyStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: _handleRegister,
      child: Container(
        height: Util.getHeightValueInPixels(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: _brandColor,
        ),
        child: Center(
          child: Text(Strings.register, style: _buttonTextStyle),
        ),
      ),
    );
  }

  Widget _alreadyHaveAccountLoginWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Strings.alreadyHaveAnAccount, style: _bodyStyle),
        SizedBox(width: Util.getWidthValueInPixels(5)),
        GestureDetector(
          onTap: _handleLogin,
          child: Text(
            Strings.login,
            style: _labelStyle.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: _brandColor,
            ),
          ),
        ),
      ],
    );
  }

  void _handleRegister() {
    // TODO: Implement login logic
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;
    print('Register attempt: $email  $password $name');
  }

  void _handleLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreenV1()),
    );
  }
}

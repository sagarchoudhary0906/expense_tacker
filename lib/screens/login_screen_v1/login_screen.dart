import 'package:expense_tracker/screens/login_screen_v1/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utiility/constants.dart';
import '../../utiility/strings.dart';
import '../../utiility/util.dart';
import '../commonWidgets/common_widgets.dart';

/// Login Screen Version 1 - A modern login interface with email/password and Google OAuth
/// Features:
/// - Email and password input fields with custom styling
/// - Google OAuth login option
/// - Registration link for new users
/// - Responsive design with safe area handling
class LoginScreenV1 extends StatefulWidget {
  const LoginScreenV1({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenV1State();
}

class _LoginScreenV1State extends State<LoginScreenV1> {
  // Text editing controllers for form validation and state management
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Util.getWidthValueInPixels(50)),
          child: _mainContent(),
        ),
      ),
    );
  }

  /// Main content with vertical layout
  Widget _mainContent() {
    return Column(
      children: [
        SizedBox(height: Util.getHeightValueInPixels(10)),
        CommonWidgets.backButtonWidget(),
        SizedBox(height: Util.getHeightValueInPixels(20)),
        _loginTextWidget(),
        _loginSubTextWidget(),
        SizedBox(height: Util.getHeightValueInPixels(40)),
        CommonWidgets.emailContainer(
            _emailController, _labelStyle, _brandColor),
        SizedBox(height: Util.getHeightValueInPixels(30)),
        CommonWidgets.passwordContainer(
            _passwordController, _labelStyle, _brandColor),
        SizedBox(height: Util.getHeightValueInPixels(50)),
        _loginButton(),
        SizedBox(height: Util.getHeightValueInPixels(20)),
        CommonWidgets.horizontalLineWidget(),
        SizedBox(height: Util.getHeightValueInPixels(20)),
        _googleLoginWidget(),
        SizedBox(height: Util.getHeightValueInPixels(40)),
        _registerWidget(),
      ],
    );
  }

  /// Main "Login" title widget
  Widget _loginTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(Strings.login, style: _titleStyle),
    );
  }

  /// Subtitle text explaining the purpose of login
  Widget _loginSubTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        Strings.loginNowToTrackAllYourExpenses,
        style: _bodyStyle,
      ),
    );
  }

  /// Reusable input field widget
  Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: _labelStyle),
        SizedBox(height: Util.getHeightValueInPixels(8)),
        Container(
          height: Util.getHeightValueInPixels(50),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(Util.getHeightValueInPixels(17)),
            border: Border.all(color: _brandColor, width: 1),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal:
                    Util.getWidthValueInPixels(15), // Left and right padding
                vertical: Util.getHeightValueInPixels(
                    12), // Top and bottom padding for vertical centering
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Primary login button
  Widget _loginButton() {
    return GestureDetector(
      onTap: _handleLogin,
      child: Container(
        height: Util.getHeightValueInPixels(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: _brandColor,
        ),
        child: Center(
          child: Text(Strings.login, style: _buttonTextStyle),
        ),
      ),
    );
  }

  /// Google OAuth login button
  Widget _googleLoginWidget() {
    return GestureDetector(
      onTap: _handleGoogleLogin,
      child: Container(
        height: Util.getHeightValueInPixels(60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(17)),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Image.asset(Constants.googleLogoIcon),
            ),
            Text(
              Strings.continueWithGoogle,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: Util.getHeightValueInPixels(20),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Registration link widget
  Widget _registerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Strings.dontHaveAnAccount, style: _bodyStyle),
        SizedBox(width: Util.getWidthValueInPixels(5)),
        GestureDetector(
          onTap: _handleRegister,
          child: Text(
            Strings.register,
            style: _labelStyle.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: _brandColor,
            ),
          ),
        ),
      ],
    );
  }

  // Event handlers
  void _handleLogin() {
    // TODO: Implement login logic
    final email = _emailController.text;
    final password = _passwordController.text;
    print('Login attempt: $email');
  }

  void _handleGoogleLogin() {
    // TODO: Implement Google OAuth
    print('Google login attempt');
  }

  void _handleRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }
}

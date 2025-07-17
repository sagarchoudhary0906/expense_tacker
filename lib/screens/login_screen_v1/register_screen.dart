import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utiility/constants.dart';
import '../../utiility/strings.dart';
import '../../utiility/util.dart';
import '../commonWidgets/common_widgets.dart';
import 'login_screen.dart';

/// RegisterScreen provides a registration form for new users.
/// Features:
/// - Email, password, and name input fields
/// - Custom styling and responsive layout
/// - Navigation to login screen for existing users
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers for form fields
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

  /// Initializes color and text styles for the screen.
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
    // Dispose controllers to free resources
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Util.getWidthValueInPixels(50),
          ),
          child: _mainContent(),
        ),
      ),
    );
  }

  /// Main content of the registration screen, arranged vertically.
  Widget _mainContent() {
    return Column(
      children: [
        // Top safe area spacing
        SizedBox(height: Util.getHeightValueInPixels(10)),
        CommonWidgets.backButtonWidget(),
        SizedBox(height: Util.getHeightValueInPixels(20)),
        _registerTextWidget(), // "Register" title
        _registerSubTextWidget(), // Subtitle with bold app name
        SizedBox(height: Util.getHeightValueInPixels(40)),
        CommonWidgets.emailContainer(
            _emailController, _labelStyle, _brandColor), // Email input
        SizedBox(height: Util.getHeightValueInPixels(30)),
        CommonWidgets.passwordContainer(
            _passwordController, _labelStyle, _brandColor), // Password input
        SizedBox(height: Util.getHeightValueInPixels(30)),
        CommonWidgets.addYourNameContainer(
            _nameController, _labelStyle, _brandColor), // Name input
        SizedBox(height: Util.getHeightValueInPixels(50)),
        _registerButton(), // Register button
        SizedBox(height: Util.getHeightValueInPixels(20)),
        CommonWidgets.horizontalLineWidget(), // Divider
        SizedBox(height: Util.getHeightValueInPixels(20)),
        _alreadyHaveAccountLoginWidget() // Link to login screen
      ],
    );
  }

  /// "Register" title widget
  Widget _registerTextWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(Strings.register, style: _titleStyle),
    );
  }

  /// Subtitle widget with bold "ExpenseTracker" text
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

  /// Register button widget
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

  /// Widget for "Already have an account? Login" with clickable login link
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

  /// Handles registration logic (to be implemented)
  void _handleRegister() {
    // TODO: Implement registration logic
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;
    print('Register attempt: $email  $password $name');
  }

  /// Navigates to the login screen and closes the register screen
  void _handleLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreenV1()),
    );
  }
}

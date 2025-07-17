import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utiility/constants.dart';
import '../../utiility/strings.dart';
import '../../utiility/util.dart';
import '../commonWidgets/common_widgets.dart';

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
}

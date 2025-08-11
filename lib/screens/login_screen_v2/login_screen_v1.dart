import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utility/constants.dart';
import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';
import '../../services/loginServices/google_login.dart';
import '../login_screen_v1/register_screen.dart';
import '../introScreens/widgets/gradient_bg.dart';

class LoginScreenV2 extends StatefulWidget {
  const LoginScreenV2({super.key});

  @override
  State<LoginScreenV2> createState() => _LoginScreenV2State();
}

class _LoginScreenV2State extends State<LoginScreenV2> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _emailNode = FocusNode();
  final _passNode = FocusNode();

  bool _isEmailValid = true;
  String _emailError = '';

  @override
  void initState() {
    super.initState();
    _emailCtrl.addListener(() {
      final email = _emailCtrl.text.trim();
      if (email.isEmpty) {
        setState(() {
          _isEmailValid = true;
          _emailError = '';
        });
      } else if (!_isValidEmail(email)) {
        setState(() {
          _isEmailValid = false;
          _emailError = Strings.pleaseEnterValidEmail;
        });
      } else {
        setState(() {
          _isEmailValid = true;
          _emailError = '';
        });
      }
    });
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _emailNode.dispose();
    _passNode.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.roboto(
      color: Colors.white,
      fontSize: Util.getHeightValueInPixels(35),
      fontWeight: FontWeight.w700,
    );
    final subStyle = GoogleFonts.roboto(
      color: Colors.white.withOpacity(0.9),
      fontSize: Util.getHeightValueInPixels(14),
      height: 1.4,
      fontWeight: FontWeight.w400,
    );
    final fieldLabelStyle = GoogleFonts.roboto(
      color: Colors.white,
      fontSize: Util.getHeightValueInPixels(14),
      fontWeight: FontWeight.w500,
    );
    final hintStyle = GoogleFonts.roboto(
      color: Colors.white.withOpacity(0.7),
      fontStyle: FontStyle.italic,
      fontSize: Util.getHeightValueInPixels(14),
      fontWeight: FontWeight.w400,
    );
    final loginTextStyle = GoogleFonts.roboto(
      color: Util.getColorForHex(Constants.HEXB684C3),
      fontSize: Util.getHeightValueInPixels(18),
      fontWeight: FontWeight.w600,
    );
    final googleTextStyle = GoogleFonts.roboto(
      color: Colors.black87,
      fontSize: Util.getHeightValueInPixels(16),
      fontWeight: FontWeight.w500,
    );
    final bottomBodyStyle = GoogleFonts.roboto(
      color: Colors.white.withOpacity(0.9),
      fontSize: Util.getHeightValueInPixels(14),
      fontWeight: FontWeight.w400,
    );
    final bottomLinkStyle = GoogleFonts.roboto(
      color: Colors.white,
      fontSize: Util.getHeightValueInPixels(14),
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const GradientBg(
              color1: Constants.HEXFFB1b1, // pink
              color2: Constants.HEXB684C3, // purple
              isTopToBottom: true,
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Util.getWidthValueInPixels(24),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Util.getHeightValueInPixels(12)),
                      // Back
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        iconSize: Util.getHeightValueInPixels(28),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      SizedBox(height: Util.getHeightValueInPixels(8)),
                      // Title
                      Text(Strings.login, style: titleStyle),
                      SizedBox(height: Util.getHeightValueInPixels(8)),
                      // Sub
                      Text(
                        Strings.loginNowToTrackAllYourExpenses,
                        style: subStyle,
                      ),
                      SizedBox(height: Util.getHeightValueInPixels(28)),

                      // Email / Phone
                      Text('Email / Phone no.', style: fieldLabelStyle),
                      SizedBox(height: Util.getHeightValueInPixels(8)),
                      _roundedInput(
                        controller: _emailCtrl,
                        node: _emailNode,
                        hint: 'Ex: abc@example.com',
                        icon: Icons.alternate_email_rounded,
                        hintStyle: hintStyle,
                        borderOk: _isEmailValid,
                      ),
                      if (!_isEmailValid) ...[
                        SizedBox(height: Util.getHeightValueInPixels(6)),
                        Text(
                          _emailError,
                          style: GoogleFonts.roboto(
                            color: Colors.yellow.shade200,
                            fontSize: Util.getHeightValueInPixels(12),
                          ),
                        ),
                      ],
                      SizedBox(
                          height: Util.getHeightValueInPixels(
                              _isEmailValid ? 20 : 8)),

                      // Password
                      Text('Your Password', style: fieldLabelStyle),
                      SizedBox(height: Util.getHeightValueInPixels(8)),
                      _roundedInput(
                        controller: _passCtrl,
                        node: _passNode,
                        hint: '••••••••',
                        icon: Icons.lock_outline_rounded,
                        obscure: true,
                        hintStyle: hintStyle,
                      ),

                      // Forgot password
                      SizedBox(height: Util.getHeightValueInPixels(8)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _onForgotPassword,
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: Util.getHeightValueInPixels(24)),

                      // Login button (white pill)
                      _pillButton(
                        bg: Colors.white,
                        border: Colors.transparent,
                        child: Center(
                          child: Text(Strings.login, style: loginTextStyle),
                        ),
                        onTap: _onLogin,
                      ),

                      SizedBox(height: Util.getHeightValueInPixels(18)),
                      _thinDivider(color: Colors.white24),

                      // Google button
                      SizedBox(height: Util.getHeightValueInPixels(18)),
                      _pillButton(
                        bg: Colors.white,
                        border: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                Constants.googleLogoIcon,
                                height: Util.getHeightValueInPixels(22),
                              ),
                            ),
                            SizedBox(width: Util.getWidthValueInPixels(8)),
                            Text(Strings.continueWithGoogle,
                                style: googleTextStyle),
                          ],
                        ),
                        onTap: _onGoogle,
                      ),

                      SizedBox(height: Util.getHeightValueInPixels(24)),
                      // Bottom register
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: Util.getWidthValueInPixels(6),
                          children: [
                            Text("Don't have an account?",
                                style: bottomBodyStyle),
                            GestureDetector(
                              onTap: _goRegister,
                              child: Text('Register', style: bottomLinkStyle),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Util.getHeightValueInPixels(20)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundedInput({
    required TextEditingController controller,
    required FocusNode node,
    required String hint,
    required IconData icon,
    required TextStyle hintStyle,
    bool obscure = false,
    bool borderOk = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(16)),
        border: Border.all(
          color: borderOk ? Colors.white38 : Colors.redAccent.shade100,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: Util.getWidthValueInPixels(6),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        focusNode: node,
        obscureText: obscure,
        style: GoogleFonts.roboto(color: Colors.white),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius:
                  BorderRadius.circular(Util.getHeightValueInPixels(12)),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          hintText: hint,
          hintStyle: hintStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: Util.getWidthValueInPixels(12),
            vertical: Util.getHeightValueInPixels(14),
          ),
        ),
      ),
    );
  }

  Widget _pillButton({
    required Color bg,
    required Color border,
    required Widget child,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Util.getHeightValueInPixels(56),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(Util.getHeightValueInPixels(18)),
          border: Border.all(color: border.withOpacity(0.6), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: Util.getWidthValueInPixels(6),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  Widget _thinDivider({required Color color}) {
    return Container(
      width: double.infinity,
      height: 1,
      color: color,
    );
  }

  void _onForgotPassword() {
    // TODO: implement flow
  }

  void _onLogin() {
    final email = _emailCtrl.text.trim();
    if (email.isEmpty || !_isValidEmail(email)) {
      setState(() {
        _isEmailValid = false;
        _emailError = Strings.pleaseEnterValidEmail;
      });
      return;
    }
    // TODO: login action
  }

  Future<void> _onGoogle() async {
    try {
      // Ensure this constant exists and is correct; name it oauthClientId (not oath).
      const String webClientId = Constants.oathClientId;
      final user = await GoogleLogin.signIn(webClientId); // await the Future
      debugPrint('GoogleLoginCM: Google sign-in result: $user');
    } on PlatformException catch (e) {
      debugPrint('GoogleLoginCM: Google sign-in error: $e');
    }
  }

  void _goRegister() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RegisterScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}

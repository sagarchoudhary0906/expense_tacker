import 'package:expense_tracker/utiility/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/commonWidgets/common_widgets.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String name, // <-- add this
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Update the display name
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload(); // Optional: refresh user info
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      CommonWidgets.showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      CommonWidgets.showSnackBar(context, Strings.emailVerificationSent);
    } on FirebaseAuthException catch (e) {
      CommonWidgets.showSnackBar(context, e.message!);
    }
  }
}

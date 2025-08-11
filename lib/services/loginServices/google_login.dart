import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '/services/native_bridge.dart';


class GoogleLogin {
  static const String _googleLogin = 'googleLogin';

  static Future<Map<String, dynamic>?> signIn(String webClientId) async {

    try {
      final res = await NativeBridge.invoke<Map>(_googleLogin, {
        'serverClientId': webClientId,
      });
      return res == null ? null : Map<String, dynamic>.from(res);
    } on PlatformException catch (e) {
      debugPrint("Sagar: Google sign-in error: $e");
      rethrow;
    }
  }
}

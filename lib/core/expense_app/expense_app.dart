import 'package:flutter/material.dart';

import '../../screens/introScreens/intro_screen_first_v1.dart';
import '../../screens/login_screen_v2/login_screen_v1.dart';
import '../appData/expense_data.dart';

class ExpenseApp {
  static Widget getInitialRoute() {
    if (ExpenseData.isIntroDone) {
      return const LoginScreenV2();
    }
    return const IntroScreenFirstV1();
  }
}

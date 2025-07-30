import 'package:flutter/material.dart';

import '../../core/utility/strings.dart';
import '../../core/utility/util.dart';

/// A utility class for common reusable widgets across the app.
class CommonWidgets {
  /// Builds a reusable input field with a label and custom styling.
  ///
  /// [label] - The label text displayed above the input.
  /// [hintText] - The placeholder text inside the input field.
  /// [controller] - The controller for managing the input's value.
  /// [labelStyle] - The text style for the label.
  /// [brandColor] - The color used for the border.
  /// [isPassword] - If true, the input will obscure the text (for passwords).
  static Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required TextStyle labelStyle,
    required Color brandColor,
    bool isPassword = false,
    FocusNode? focusNode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the input field
        Text(label, style: labelStyle),
        SizedBox(height: Util.getHeightValueInPixels(8)),
        // Input field with custom border and padding
        Container(
          height: Util.getHeightValueInPixels(50),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(Util.getHeightValueInPixels(17)),
            border: Border.all(color: brandColor, width: 1),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal:
                    Util.getWidthValueInPixels(15), // Padding for left/right
                vertical:
                    Util.getHeightValueInPixels(12), // Padding for top/bottom
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Returns a back button icon aligned to the left.
  static Widget backButtonWidget() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ),
    );
  }

  /// Returns a styled email input field.
  static Widget emailContainer(
    TextEditingController emailController,
    TextStyle labelStyle,
    Color brandColor,
    bool isValid,
    FocusNode? focusNode,
  ) {
    return _buildInputField(
      label: Strings.email,
      hintText: Strings.enterYouremail,
      controller: emailController,
      labelStyle: labelStyle,
      brandColor: isValid ? brandColor : Colors.red,
      focusNode: focusNode,
    );
  }

  /// Returns a styled password input field (obscured).
  static Widget passwordContainer(
    TextEditingController passwordController,
    TextStyle labelStyle,
    Color brandColor,
    FocusNode? focusNode,
  ) {
    return _buildInputField(
      label: Strings.password,
      hintText: Strings.enterYourPass,
      controller: passwordController,
      labelStyle: labelStyle,
      brandColor: brandColor,
      isPassword: true, // Ensures password is obscured
      focusNode: focusNode,
    );
  }

  /// Returns a styled name input field.
  static Widget addYourNameContainer(
    TextEditingController nameController,
    TextStyle labelStyle,
    Color brandColor,
    FocusNode? focusNode,
  ) {
    return _buildInputField(
      label: Strings.yourName,
      hintText: Strings.enterYourName,
      controller: nameController,
      labelStyle: labelStyle,
      brandColor: brandColor,
      focusNode: focusNode,
    );
  }

  /// Returns a horizontal divider line.
  static Widget horizontalLineWidget() {
    return Container(
      height: 1,
      color: Colors.black,
    );
  }

  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

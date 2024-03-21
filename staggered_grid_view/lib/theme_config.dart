import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color primarColor = Color(0xFFD6DA7C);
  static const Color primaryColorLight = Color(0xFF03090D);

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    primaryColor: primarColor,
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
  );

  static const TextStyle _displayLarge = TextStyle(
    color: primaryColorLight,
    height: 1.12,
    fontSize: 57.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _displayMedium = TextStyle(
      color: primaryColorLight,
      height: 1.15,
      fontSize: 45.0,
      fontWeight: FontWeight.w400);

  static const TextStyle _displaySmall = TextStyle(
      color: primaryColorLight,
      height: 1.2,
      fontSize: 36,
      fontWeight: FontWeight.w400);
}

extension MaterialPropX<T> on T {
  MaterialStateProperty<T> wrapMatProp() =>
      MaterialStateProperty.resolveWith<T>(
        (states) => this,
      );
}

extension MaterialColorPropX<Color> on Color {
  MaterialStateProperty<Color> wrapMatButtonColor({
    required Color disabledColor,
  }) =>
      MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledColor;
        } else {
          return this;
        }
      });
}

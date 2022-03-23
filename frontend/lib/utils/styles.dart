import 'package:flutter/material.dart';

extension ColorExtension on Color {
  MaterialColor get swatch => Colors.primaries.firstWhere(
        (Color c) => c.value == value,
    orElse: () => _swatch,
  );

  Map<int, Color> get getMaterialColorValues => <int, Color>{
    50: _swatchShade(50),
    100: _swatchShade(100),
    200: _swatchShade(200),
    300: _swatchShade(300),
    400: _swatchShade(400),
    500: _swatchShade(500),
    600: _swatchShade(600),
    700: _swatchShade(700),
    800: _swatchShade(800),
    900: _swatchShade(900),
  };

  MaterialColor get _swatch => MaterialColor(value, getMaterialColorValues);

  Color _swatchShade(int swatchValue) => HSLColor.fromColor(this)
      .withLightness(1 - (swatchValue / 1000))
      .toColor();
}

class AppColor {
  static const primary = Color.fromARGB(255, 251, 150, 110);
  static MaterialColor primarySwatch = primary.swatch;
  static const active = primary;
  static const inactive = Colors.white24;

  static const authPrimary = primary;
  static const authTitle = Colors.white;
  static const authAccent = primary;
  static const authCardColor = Color.fromARGB(255, 247, 238, 213);

  static const tipBackground = Color.fromARGB(255, 247, 238, 213);
  static const tipText = Color.fromRGBO(141, 141, 141, 1.0);
}

class AppFont {
  static const chinese = 'FZFYSJW';
  static const ascii = 'Vladimir';
  static const authWeight = FontWeight.w600;
  static const authBannerWordSpacing = 10.0;
  static const authBannerSize = 60.0;
}



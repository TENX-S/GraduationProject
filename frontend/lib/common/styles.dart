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
  static const primary = Color.fromARGB(255, 135, 33, 36);
  static const contrast = Color.fromARGB(255, 225, 220, 220);
  static MaterialColor primarySwatch = primary.swatch;
  static const active = primary;
  static const inactive = Colors.white24;

  static const mainAppBarBg = btmNavBarActive;

  static const authPrimary = primary;
  static const authText = Colors.black;
  static const authTitle = contrast;
  static const authAccent = contrast;
  static const authCard = contrast;

  static const tipBg = Color.fromARGB(255, 247, 238, 213);
  static const tipText = Color.fromRGBO(141, 141, 141, 1.0);
  static const btmNavBarBg = Color(0xFFFBFBFB);
  static const btmNavBarActive = primary;
  static const btmNavBarInactive = Color(0xFFD0D0D0);

  static const homeDetail = Color(0xFFE3916E);

  static const collAppBar = Colors.white;
  static const title = Colors.black;
  static const collTabIndicator = primary;
  static const collTabUnselected = Colors.grey;

  static const postCollectButton = Colors.white;
  static const postDescr = Colors.grey;

  static const userBg = Color(0xFFF3F2F2);
  static const userAvatarBg = Color(0xFFAAAAAA);
  static const userMenuBarBg = Color(0xFFFEFEFE);
}

class AppFont {
  static const label = 'NSSC';
  static const title = 'FZFYSJW';
  static const logo = 'Vladimir';
  static const dynasty = 'KaiTi';
  static const authWeight = FontWeight.w600;
  static const authBannerWordSpacing = 10.0;
  static const authBannerSize = 60.0;
}

import 'package:flutter/material.dart';
import 'package:portfolio/common/color.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: kFlutterPrimaryDark,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Colors.white,
  onPrimaryContainer: Color(0xFF001B3E),
  secondary: Color(0xFF686000),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFF2E66A),
  onSecondaryContainer: Color(0xFF1F1C00),
  tertiary: Color(0xFF6F5575),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFF9D8FD),
  onTertiaryContainer: Color(0xFF28132E),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Colors.white,
  onBackground: Color(0xFF001F25),
  surface: Color(0xFFF8FDFF),
  onSurface: Colors.black,
  surfaceVariant: Color(0xFFE0E2EC),
  onSurfaceVariant: Color(0xFF44474E),
  outline: Color(0xFF74777F),
  onInverseSurface: Color(0xFFD6F6FF),
  inverseSurface: Color.fromARGB(255, 44, 44, 44),
  inversePrimary: kFlutterPrimaryDark,
  shadow: Color(0xFF000000),
  surfaceTint: Colors.white,
  outlineVariant: Colors.white,
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Colors.white,
  onPrimary: Color(0xFF002F64),
  primaryContainer: Color(0xFF00468D),
  onPrimaryContainer: Color(0xFFD6E3FF),
  secondary: Color(0xFFD5C951),
  onSecondary: Color(0xFF363100),
  secondaryContainer: Color(0xFF4E4800),
  onSecondaryContainer: Color(0xFFF2E66A),
  tertiary: Color(0xFFDCBCE0),
  onTertiary: Color(0xFF3F2844),
  tertiaryContainer: Color(0xFF563E5C),
  onTertiaryContainer: Color(0xFFF9D8FD),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: kFlutterPrimaryDark,
  onBackground: Color(0xFFA6EEFF),
  surface: kFlutterPrimaryDark,
  onSurface: Colors.white,
  surfaceVariant: Color(0xFF44474E),
  onSurfaceVariant: Colors.white,
  outline: Colors.white,
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color.fromARGB(255, 210, 210, 210),
  inversePrimary: Colors.white,
  shadow: Color(0xFF000000),
  surfaceTint: Colors.transparent,
  outlineVariant: Color(0xFF44474E),
  scrim: Color(0xFF000000),
);

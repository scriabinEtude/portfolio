import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  // ThemeMode themeMode = ThemeMode.dark;
  // ThemeMode themeMode = ThemeMode.light;

  void setTheme(ThemeMode newOne) {
    themeMode = newOne;
    notifyListeners();
  }

  void setThemeByBool(bool isLight) {
    setTheme(isLight ? ThemeMode.light : ThemeMode.dark);
  }

  bool isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}

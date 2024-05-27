import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'light';

  ThemeMode get themeMode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    }
    else {
      return ThemeMode.dark;
    }
  }

  setTheme(String theme) {
    currentTheme = theme;
    notifyListeners();
  }

  String getTheme() {
    return currentTheme;
  }
}



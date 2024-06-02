import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  String _currentTheme = 'light';

  ThemeMode get themeMode {
    if (_currentTheme == 'light') {
      return ThemeMode.light;
    }
    else {
      return ThemeMode.dark;
    }
  }

  setTheme(String theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  String getTheme() {
    return _currentTheme;
  }
}



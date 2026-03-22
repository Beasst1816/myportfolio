import 'package:flutter/material.dart';

/// Drives light/dark mode for the portfolio.
final class ThemeController extends ChangeNotifier {
  ThemeController({ThemeMode initialMode = ThemeMode.system}) : _mode = initialMode;

  ThemeMode _mode;

  ThemeMode get mode => _mode;

  bool get isDark {
    return switch (_mode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark,
    };
  }

  void setLight() {
    if (_mode != ThemeMode.light) {
      _mode = ThemeMode.light;
      notifyListeners();
    }
  }

  void setDark() {
    if (_mode != ThemeMode.dark) {
      _mode = ThemeMode.dark;
      notifyListeners();
    }
  }

  void toggle() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final effectiveDark = switch (_mode) {
      ThemeMode.dark => true,
      ThemeMode.light => false,
      ThemeMode.system => brightness == Brightness.dark,
    };
    _mode = effectiveDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

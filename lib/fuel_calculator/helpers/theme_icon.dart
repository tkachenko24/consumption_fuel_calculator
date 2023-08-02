import 'package:flutter/material.dart';

class ThemeIconHelper {
  static Icon getThemeIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return const Icon(Icons.smartphone_sharp);
      case ThemeMode.light:
        return const Icon(Icons.light_mode_sharp);
      case ThemeMode.dark:
        return const Icon(Icons.nightlight_round);
      default:
        return const Icon(Icons.smartphone_sharp);
    }
  }
}

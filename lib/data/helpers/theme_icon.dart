import 'package:flutter/material.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';

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

  static String getThemeIconTooltip(
      ThemeMode themeMode, AppLocalizations translates) {
    switch (themeMode) {
      case ThemeMode.system:
        return translates.theme_system_icon;
      case ThemeMode.light:
        return translates.theme_light_icon;
      case ThemeMode.dark:
        return translates.theme_dark_icon;
      default:
        return translates.theme_system_icon;
    }
  }
}

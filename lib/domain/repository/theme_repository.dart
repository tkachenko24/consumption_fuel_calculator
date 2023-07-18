import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository extends StateNotifier<ThemeMode> {
  ThemeRepository() : super(ThemeMode.system);

  static const String _themeKey = 'selected_theme';

  Future<void> switchTheme() async {
    state = getNextThemeMode(state);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, state.toString());
  }

  Future<void> loadSelectedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedTheme = prefs.getString(_themeKey);

    if (selectedTheme != null) {
      state = parseThemeMode(selectedTheme);
    }
  }

  ThemeMode parseThemeMode(String themeString) {
    switch (themeString) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  ThemeMode getNextThemeMode(ThemeMode currentMode) {
    if (currentMode == ThemeMode.system) {
      return ThemeMode.light;
    } else if (currentMode == ThemeMode.light) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}

final themeStateProvider =
    StateNotifierProvider<ThemeRepository, ThemeMode>((ref) {
  final themeRepo = ThemeRepository();
  themeRepo.loadSelectedTheme();
  return themeRepo;
});

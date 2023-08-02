import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/screens/widgets/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/theme/export.dart';

class ThemeAppImpl extends StateNotifier<ThemeMode> implements ThemeApp {
  ThemeAppImpl() : super(ThemeMode.system);

  static const String _themeKey = 'selected_theme';

  @override
  Future<void> switchTheme() async {
    state = getNextThemeMode(state);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, state.toString());
  }

  @override
  Future<void> loadSelectedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedTheme = prefs.getString(_themeKey);

    if (selectedTheme != null) {
      state = parseThemeMode(selectedTheme);
    }
  }

  @override
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

  @override
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

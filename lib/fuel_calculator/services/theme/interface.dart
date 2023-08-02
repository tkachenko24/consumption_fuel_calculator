import 'package:vehicle_consumption_calculator/fuel_calculator/screens/widgets/export.dart';

abstract class ThemeApp {
  Future<void> switchTheme();
  Future<void> loadSelectedTheme();
  ThemeMode parseThemeMode(String themeString);
  ThemeMode getNextThemeMode(ThemeMode currentMode);
}

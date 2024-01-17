import 'package:vehicle_consumption_calculator/fuel_calculator/presentation/widgets/export.dart';

abstract class ThemeApp {
  Future<void> change();
  Future<void> loadSelectedTheme();
  ThemeMode parseThemeMode(String themeString);
  ThemeMode getNextThemeMode(ThemeMode currentMode);
}

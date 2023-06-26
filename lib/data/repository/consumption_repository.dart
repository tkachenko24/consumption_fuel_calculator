import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class ConsumptionRepository extends StateNotifier<ThemeMode> {
  ConsumptionRepository() : super(ThemeMode.system);

  void switchTheme() {
    state = getNextThemeMode(state);
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
    StateNotifierProvider<ConsumptionRepository, ThemeMode>((ref) {
  return ConsumptionRepository();
});
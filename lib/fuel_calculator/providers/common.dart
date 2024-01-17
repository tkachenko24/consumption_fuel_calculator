import 'package:vehicle_consumption_calculator/fuel_calculator/presentation/export.dart';

final storageProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

final themeStateProvider =
    StateNotifierProvider<ThemeAppImpl, ThemeMode>((ref) {
  final themeRepo = ThemeAppImpl();
  themeRepo.loadSelectedTheme();
  return themeRepo;
});

final modeStateProvider = StateNotifierProvider<ModeAppImpl, FlexScheme>((ref) {
  final modeRepo = ModeAppImpl();
  modeRepo.loadSelectedMode();
  return modeRepo;
});

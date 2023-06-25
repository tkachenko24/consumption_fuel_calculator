import 'package:consumption_fuel_calculator/presentation/screens/screen.dart';
import 'package:consumption_fuel_calculator/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: FuelApp()),
  );
}

class FuelApp extends ConsumerWidget {
  const FuelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeStateProvider);
    return MaterialApp(
      title: 'Consumption Fuel Calculator',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const FuelScreen(),
    );
  }
}

class ThemeStateNotifier extends StateNotifier<ThemeMode> {
  ThemeStateNotifier() : super(ThemeMode.system);

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
    StateNotifierProvider<ThemeStateNotifier, ThemeMode>((ref) {
  return ThemeStateNotifier();
});

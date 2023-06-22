import 'package:consumption_fuel_calculator/data/export.dart';
import 'package:consumption_fuel_calculator/presentation/screens/screen.dart';
import 'package:consumption_fuel_calculator/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:consumption_fuel_calculator/domain/export.dart';

void main() {
  runApp(
    const ProviderScope(child: FuelApp()),
  );
}

class FuelApp extends ConsumerWidget {
  const FuelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref
        .watch(themeStateProvider.notifier)
        .state; // Отримання поточного значення стану теми
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

final themeStateProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system; // Початкове значення стану теми
});

ThemeMode getNextThemeMode(ThemeMode currentMode) {
  if (currentMode == ThemeMode.system) {
    return ThemeMode.light;
  } else if (currentMode == ThemeMode.light) {
    return ThemeMode.dark;
  } else {
    return ThemeMode.system;
  }
}

import 'package:consumption_fuel_calculator/presentation/screens/screen.dart';
import 'package:consumption_fuel_calculator/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const FuelApp());
}

class FuelApp extends StatelessWidget {
  const FuelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Consumption Fuel Calculator',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: const FuelScreen());
  }
}

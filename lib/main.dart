import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: ConsumptionApp()),
  );
}

class ConsumptionApp extends ConsumerWidget {
  const ConsumptionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mode = ref.watch(modeStateProvider);
    return MaterialApp(
      title: 'Consumption Consumption Calculator',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: FlexColorScheme.light(scheme: mode, useMaterial3: true).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: mode, useMaterial3: true).toTheme,
      themeMode: ref.watch(themeStateProvider),
      home: const ConsumptionScreen(),
    );
  }
}

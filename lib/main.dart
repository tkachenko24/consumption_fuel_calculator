import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/screens/screen.dart';
import 'package:vehicle_consumption_calculator/presentation/theme/theme.dart';
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
    var themeMode = ref.watch(themeStateProvider);
    return MaterialApp(
      title: 'Consumption Consumption Calculator',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const ConsumptionScreen(),
    );
  }
}

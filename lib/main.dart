import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/domain/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Vehicle Consumption Calculator',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: FlexColorScheme.light(scheme: mode, useMaterial3: true).toTheme,
      darkTheme: FlexColorScheme.dark(scheme: mode, useMaterial3: true).toTheme,
      themeMode: ref.watch(themeStateProvider),
      routes: <String, WidgetBuilder>{
        '/screen': (BuildContext context) => const ConsumptionScreen(),
        '/info': (BuildContext context) => const InfoScreen(),
      },
      home: const ConsumptionScreen(),
    );
  }
}

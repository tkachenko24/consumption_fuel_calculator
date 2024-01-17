import 'package:vehicle_consumption_calculator/fuel_calculator/export.dart';

class ConsumptionScreen extends StatelessWidget {
  const ConsumptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translates = AppLocalizations.of(context)!,
        color = Theme.of(context).colorScheme,
        query = MediaQuery.of(context).size,
        height = query.height,
        width = query.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: color.onPrimary,
      appBar: TopBar(
        color: color,
        translates: translates,
        height: height,
        info: false,
      ),
      body: Pump(
        color: color,
        height: height,
        translates: translates,
        width: width,
      ),
      bottomNavigationBar: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return FutureBuilder(
              future: ref.watch(storageProvider.future),
              builder: (context, snapshot) {
                return BottomBar(
                  color: color,
                  height: height,
                  translates: translates,
                  db: ref.watch(dataBaseProvider),
                  isLoading:
                      snapshot.connectionState == ConnectionState.waiting,
                );
              });
        },
      ),
    );
  }
}

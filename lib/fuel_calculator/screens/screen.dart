import 'package:vehicle_consumption_calculator/fuel_calculator/export.dart';

class ConsumptionScreen extends StatelessWidget {
  const ConsumptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translates = AppLocalizations.of(context)!,
        color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: color.onPrimary,
      appBar: ConsumptionTopAppBar(
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
      bottomNavigationBar: ConsumptionBottomAppBar(
        color: color,
        height: height,
        translates: translates,
      ),
    );
  }
}

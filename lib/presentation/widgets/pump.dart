import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class Pump extends StatelessWidget {
  const Pump({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final translates = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(
          top: height * 0.02, left: height * 0.02, right: height * 0.02),
      child: Container(
        color: color.outline,
        height: double.infinity,
        padding: EdgeInsets.only(
          top: height * 0.02,
          left: height * 0.02,
          right: height * 0.02,
        ),
        child: Column(
          children: [
            PumpDisplay(
              color: color,
              height: height,
              translates: translates,
            ),
            ConsumptionDisplay(
                height: height,
                color: color,
                width: width,
                translates: translates)
          ],
        ),
      ),
    );
  }
}

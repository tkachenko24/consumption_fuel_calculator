import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class Pump extends StatelessWidget {
  const Pump({
    super.key,
    required this.translates,
    required this.height,
    required this.width,
    required this.color,
  });
  final AppLocalizations translates;
  final double height, width;
  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
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
              width: width,
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

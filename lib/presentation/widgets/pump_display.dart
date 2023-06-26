import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class PumpDisplay extends StatelessWidget {
  const PumpDisplay({
    super.key,
    required this.color,
    required this.height,
    required this.translates,
  });
  final AppLocalizations translates;
  final ColorScheme color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.shadow,
      height: height * 0.32,
      padding: EdgeInsets.all(
        height * 0.02,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PumpRow(text: translates.volume),
          PumpRow(text: translates.price),
          PumpRow(text: translates.distance),
        ],
      ),
    );
  }
}

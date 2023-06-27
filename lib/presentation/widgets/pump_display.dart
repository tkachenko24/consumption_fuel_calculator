import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      child: Consumer(
        builder: (context, ref, child) {
          final unit = ref.watch(unitStateProvider);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PumpRow(
                  text: translates.volume,
                  unit: unit ? translates.litres : translates.gallons),
              PumpRow(text: translates.price, unit: ""),
              PumpRow(
                  text: translates.distance,
                  unit: unit ? translates.kilometers : translates.miles),
            ],
          );
        },
      ),
    );
  }
}

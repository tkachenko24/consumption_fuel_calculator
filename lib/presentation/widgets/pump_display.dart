import 'package:flex_color_scheme/flex_color_scheme.dart';
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
          final mode = ref.watch(modeStateProvider) == FlexScheme.orangeM3;
          final fuelData = ref.watch(fuelDataStateProvider);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PumpRow(
                text: mode ? translates.volume : translates.capacity,
                unit: mode
                    ? unit
                        ? translates.litres
                        : translates.gallons
                    : translates.kilowatts,
                translates: translates,
                status: true,
                controller: TextEditingController(
                  text: fuelData.fuelVolume.toString(),
                ),
                onChanged: (value) {
                  ref.read(fuelDataStateProvider.notifier).state = fuelData
                      .copyWith(fuelVolume: double.tryParse(value) ?? 0.0);
                },
              ),
              PumpRow(
                text: translates.price,
                unit: '',
                translates: translates,
                status: false,
                controller: TextEditingController(text: ""),
                onChanged: (bool) {},
              ),
              PumpRow(
                text: translates.distance,
                unit: unit ? translates.kilometers : translates.miles,
                translates: translates,
                status: true,
                controller: TextEditingController(
                  text: fuelData.distance.toString(),
                ),
                onChanged: (value) {
                  ref.read(fuelDataStateProvider.notifier).state = fuelData
                      .copyWith(distance: double.tryParse(value) ?? 0.0);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

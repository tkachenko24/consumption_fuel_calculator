import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class ConsumptionDisplay extends StatelessWidget {
  const ConsumptionDisplay({
    super.key,
    required this.height,
    required this.color,
    required this.width,
    required this.translates,
  });

  final double height;
  final ColorScheme color;
  final double width;
  final AppLocalizations translates;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.09),
      padding: EdgeInsets.all(height * 0.02),
      color: color.shadow,
      height: height * 0.24,
      width: width * 0.7,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(builder: (context, ref, child) {
              final unit = ref.watch(unitStateProvider);
              final mode = ref.watch(modeStateProvider) == FlexScheme.orangeM3;
              final fuelData = ref.watch(fuelDataStateProvider);

              double consumption =
                  calculateConsumption(fuelData.fuelVolume, fuelData.distance);
              return Text(
                "${translates.consumption}, ${unit ? translates.metric_consumption(mode ? translates.litres : translates.kilowatts) : translates.imperial_consumption(mode ? translates.gallons : translates.kilowatts)}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Gill(
                  color: Colors.white,
                  fontSize: height * 0.025,
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                DotIndicator(
                  height: height,
                  color: color,
                  status: true,
                ),
                DotIndicator(
                  height: height,
                  color: color,
                  status: true,
                ),
                DotIndicator(
                  height: height,
                  color: color,
                  status: false,
                ),
                const Spacer(),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      PumpInput(
                        // ЗУПИНИВСЯ ТУТ

                        height: height,
                        color: color,
                        readOnly: true,
                        size: 0.07,
                        width: width,
                        cursor: false,
                        controller: TextEditingController(text: ""),
                        onChanged: (String) {},
                      ),
                    ],
                  ),
                ),
                AppButton(
                    icon: const Icon(Icons.save_sharp),
                    onTap: () {},
                    tooltipText: translates.save_tooltip,
                    iconColor: color.onSecondaryContainer,
                    backgroundColor: color.outline,
                    borderColor: color.outline,
                    size: 0.04)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

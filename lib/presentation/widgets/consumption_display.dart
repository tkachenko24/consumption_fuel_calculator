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
        child: Consumer(builder: (context, ref, child) {
          final fuelData = ref.watch(fuelDataStateProvider);
          double consumption =
              calculateConsumption(fuelData.fuelVolume, fuelData.distance, ref);
          final unit = ref.watch(unitStateProvider);
          final mode = ref.watch(modeStateProvider) == FlexScheme.orangeM3;
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${translates.consumption}, ${unit ? translates.metric_consumption(mode ? translates.litres : translates.kilowatts) : translates.imperial_consumption(mode ? translates.gallons : translates.kilowatts)}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Gill(
                    color: Colors.white,
                    fontSize: height * 0.025,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    DotIndicator(
                      height: height,
                      color: color,
                      status: fuelData.fuelVolume != 0,
                    ),
                    DotIndicator(
                      height: height,
                      color: color,
                      status: fuelData.price != 0,
                    ),
                    DotIndicator(
                      height: height,
                      color: color,
                      status: fuelData.distance != 0,
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(height * 0.005),
                      color: color.primary,
                      width: width * 0.47,
                      height: height * 0.1,
                      child: Text(
                        "${consumption.toStringAsFixed(2)}   ",
                        textAlign: TextAlign.end,
                        style: Segment7(
                            color: color.shadow, fontSize: height * 0.08),
                      ),
                    ),
                    const Spacer(),
                    AppButton(
                      icon: const Icon(Icons.save_sharp),
                      onTap: () {
                        if (fuelData.distance != 0 &&
                            fuelData.price != 0 &&
                            fuelData.fuelVolume != 0) {
                          return print(Text("acces granted"));
                        } else {
                          return print(Text("access denied"));
                        }
                      },
                      tooltipText: translates.save_tooltip,
                      iconColor: color.onSecondaryContainer,
                      backgroundColor: color.outline,
                      borderColor: color.outline,
                      size: 0.04,
                      color: color,
                      height: height,
                    )
                  ],
                ),
              ]);
        }),
      ),
    );
  }
}

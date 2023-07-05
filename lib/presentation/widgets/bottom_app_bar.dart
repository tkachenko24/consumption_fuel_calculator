import 'package:vehicle_consumption_calculator/presentation/export.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumptionAppBar extends StatelessWidget {
  const ConsumptionAppBar({
    super.key,
    required this.translates,
    required this.height,
    required this.color,
  });
  final AppLocalizations translates;
  final double height;
  final ColorScheme color;

  void showConsumptionSheet(BuildContext context) {
    showModalBottomSheet(
      elevation: 10,
      backgroundColor: color.onPrimary,
      context: context,
      isScrollControlled: true,
      shape: const ContinuousRectangleBorder(),
      builder: (context) {
        return ConsumptionSheet(
          height: height,
          color: color,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height * 0.15,
      elevation: 0,
      color: Colors.transparent,
      child: IconTheme(
        data: IconThemeData(color: color.onPrimary),
        child: Consumer(builder: (context, ref, child) {
          var theme = ref.read(themeStateProvider.notifier);
          var unit = ref.read(unitStateProvider.notifier);
          var mode = ref.read(modeStateProvider.notifier);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AppButton(
                tooltipText: translates.theme_tooltip,
                icon:
                    ThemeIconHelper.getThemeIcon(ref.watch(themeStateProvider)),
                onTap: () {
                  theme.switchTheme();
                },
                backgroundColor: color.inversePrimary,
                borderColor: color.inversePrimary,
                iconColor: color.inverseSurface,
                size: 0.04,
                color: color,
                height: height,
              ),
              AppButton(
                tooltipText: translates.mode_tooltip,
                icon: ModeIconHelper.getModeIcon(ref.watch(modeStateProvider)),
                onTap: () {
                  mode.switchMode();
                },
                backgroundColor: color.inversePrimary,
                borderColor: color.inversePrimary,
                iconColor: color.inverseSurface,
                size: 0.04,
                color: color,
                height: height,
              ),
              AppButton(
                tooltipText: translates.units_tooltip,
                icon: const Icon(Icons.scale_sharp),
                onTap: () {
                  unit.switchUnit();
                },
                backgroundColor: color.inversePrimary,
                borderColor: color.inversePrimary,
                iconColor: color.inverseSurface,
                size: 0.04,
                color: color,
                height: height,
              ),
              AppButton(
                tooltipText: translates.list_tooltip,
                icon: const Icon(Icons.list_alt_sharp),
                onTap: () {
                  showConsumptionSheet(context);
                },
                backgroundColor: color.inversePrimary,
                borderColor: color.inversePrimary,
                iconColor: color.inverseSurface,
                size: 0.04,
                color: color,
                height: height,
              ),
            ],
          );
        }),
      ),
    );
  }
}

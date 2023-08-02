import 'package:vehicle_consumption_calculator/fuel_calculator/components/app_bar.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/components/sheet.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/helpers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/screens/widgets/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/data_base/interface.dart';

class ConsumptionBottomAppBar extends StatelessWidget {
  const ConsumptionBottomAppBar(
      {super.key,
      required this.translates,
      required this.height,
      required this.color,
      this.db});
  final AppLocalizations translates;
  final double height;
  final ColorScheme color;
  final DataBase? db;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height * 0.15,
      elevation: 0,
      color: Colors.transparent,
      child: IconTheme(
        data: IconThemeData(color: color.onPrimary),
        child: Consumer(builder: (context, ref, child) {
          var theme = ref.read(themeStateProvider.notifier),
              unit = ref.read(unitStateProvider.notifier),
              mode = ref.read(modeStateProvider.notifier);
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
                  showConsumptionSheet(
                      context, ref, color, height, translates, db);
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

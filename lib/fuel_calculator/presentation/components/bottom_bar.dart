import 'package:vehicle_consumption_calculator/fuel_calculator/export.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(
      {super.key,
      required this.translates,
      required this.height,
      required this.color,
      required this.isLoading,
      this.db});
  final AppLocalizations translates;
  final double height;
  final ColorScheme color;
  final DataBase? db;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height * 0.15,
      elevation: 0,
      color: Colors.transparent,
      child: IconTheme(
        data: IconThemeData(color: color.onPrimary),
        child: Consumer(builder: (context, ref, child) {
          var theme = ref.watch(themeStateProvider.notifier),
              unit = ref.watch(unitStateProvider.notifier),
              mode = ref.watch(modeStateProvider.notifier),
              iconSize = 0.04;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AppButton(
                tooltipText: translates.theme_tooltip,
                icon:
                    ThemeIconHelper.getThemeIcon(ref.watch(themeStateProvider)),
                onTap: () {
                  theme.change();
                },
                backgroundColor: color.inversePrimary,
                borderColor: color.inversePrimary,
                iconColor: color.inverseSurface,
                size: iconSize,
                color: color,
                height: height,
                isLoading: isLoading,
              ),
              AppButton(
                tooltipText: translates.mode_tooltip,
                icon: ModeIconHelper.getModeIcon(ref.watch(modeStateProvider)),
                onTap: () {
                  mode.change();
                },
                backgroundColor: color.inversePrimary,
                borderColor: color.inversePrimary,
                iconColor: color.inverseSurface,
                size: iconSize,
                color: color,
                height: height,
                isLoading: isLoading,
              ),
              AppButton(
                tooltipText: translates.units_tooltip,
                icon: const Icon(Icons.scale_sharp),
                onTap: () {
                  unit.change();
                },
                backgroundColor: color.inversePrimary,
                borderColor: color.inversePrimary,
                iconColor: color.inverseSurface,
                size: iconSize,
                color: color,
                height: height,
                isLoading: isLoading,
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
                size: iconSize,
                color: color,
                height: height,
                isLoading: isLoading,
              ),
            ],
          );
        }),
      ),
    );
  }
}

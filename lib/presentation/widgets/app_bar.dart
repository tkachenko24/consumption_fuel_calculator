import 'package:vehicle_consumption_calculator/presentation/export.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumptionAppBar extends StatelessWidget {
  const ConsumptionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translates = AppLocalizations.of(context)!;
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;

    return BottomAppBar(
      height: height * 0.15,
      elevation: 0,
      color: Colors.transparent,
      child: IconTheme(
        data: IconThemeData(color: color.onPrimary),
        child: Consumer(builder: (context, ref, child) {
          var theme = ref.read(themeStateProvider.notifier);
          var themeMode = ref.watch(themeStateProvider);
          var unit = ref.read(unitStateProvider.notifier);
          var mode = ref.read(modeStateProvider.notifier);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AppBarButton(
                tooltipText:
                    ThemeIconHelper.getThemeIconTooltip(themeMode, translates),
                icon: ThemeIconHelper.getThemeIcon(themeMode),
                onTap: () {
                  theme.switchTheme();
                },
              ),
              AppBarButton(
                tooltipText: 'TO DO',
                icon: const Icon(Icons.ev_station_sharp),
                onTap: () {
                  mode.switchMode();
                },
              ),
              AppBarButton(
                tooltipText: translates.units_tooltip,
                icon: const Icon(Icons.scale_sharp),
                onTap: () {
                  unit.switchUnit();
                },
              ),
              AppBarButton(
                tooltipText: 'TO DO',
                icon: const Icon(Icons.currency_exchange_sharp),
                onTap: () {},
              ),
              AppBarButton(
                tooltipText: translates.list_tooltip,
                icon: const Icon(Icons.list_alt_sharp),
                onTap: () {},
              ),
            ],
          );
        }),
      ),
    );
  }
}

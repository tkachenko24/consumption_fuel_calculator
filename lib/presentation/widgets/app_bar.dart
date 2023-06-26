import 'package:vehicle_consumption_calculator/presentation/export.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumptionAppBar extends ConsumerWidget {
  const ConsumptionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translates = AppLocalizations.of(context)!;
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var state = themeStateProvider.notifier;
    var theme = ref.read(state);
    var themeMode = ref.watch(themeStateProvider);

    return BottomAppBar(
      height: height * 0.15,
      elevation: 0,
      color: Colors.transparent,
      child: IconTheme(
        data: IconThemeData(color: color.onPrimary),
        child: Row(
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
              onTap: () {},
            ),
            AppBarButton(
              tooltipText: 'TO DO',
              icon: const Icon(Icons.scale_sharp),
              onTap: () {},
            ),
            AppBarButton(
              tooltipText: 'TO DO',
              icon: const Icon(Icons.language_sharp),
              onTap: () {},
            ),
            AppBarButton(
              tooltipText: 'TO DO',
              icon: const Icon(Icons.list_alt_sharp),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:consumption_fuel_calculator/main.dart';
import 'package:consumption_fuel_calculator/presentation/widgets/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FuelAppBar extends ConsumerWidget {
  const FuelAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var height = MediaQuery.of(context).size.height;
    final translates = AppLocalizations.of(context)!;
    final color = Theme.of(context).colorScheme;
    final themeState =
        ref.watch(themeStateProvider.notifier); // Отримання стану теми
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.02,
      ),
      child: BottomAppBar(
          color: Colors.transparent,
          child: IconTheme(
            data: IconThemeData(color: color.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                AppBarButton(
                    tooltipText: translates.theme_tooltip,
                    icon: const Icon(Icons.lightbulb_sharp),
                    onTap: () {
                      ref.read(themeStateProvider.notifier).state =
                          getNextThemeMode(themeState.state);

                      print(themeState.state);
                    }),
                AppBarButton(
                    tooltipText: translates.units_tooltip,
                    icon: const Icon(Icons.swap_horiz_sharp),
                    onTap: () {}),
                AppBarButton(
                    tooltipText: translates.language_tooltip,
                    icon: const Icon(Icons.language_sharp),
                    onTap: () {}),
                AppBarButton(
                    tooltipText: translates.list_tooltip,
                    icon: const Icon(Icons.list_alt_sharp),
                    onTap: () {})
              ],
            ),
          )),
    );
  }
}

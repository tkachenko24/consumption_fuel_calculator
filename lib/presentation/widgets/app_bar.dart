import 'package:consumption_fuel_calculator/main.dart';
import 'package:consumption_fuel_calculator/presentation/fonts/avenir.dart';
import 'package:consumption_fuel_calculator/presentation/widgets/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FuelAppBar extends ConsumerWidget {
  const FuelAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translates = AppLocalizations.of(context)!;
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var state = themeStateProvider.notifier;
    var theme = ref.read(state);
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.02,
      ),
      child: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        height: height * 0.15,
        elevation: 0,
        color: Colors.transparent,
        child: IconTheme(
          data: IconThemeData(color: color.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AppBarButton(
                iconText: translates.theme_system_icon,
                icon: const Icon(Icons.lightbulb_sharp),
                onTap: () {
                  theme.switchTheme();
                },
              ),
              AppBarButton(
                iconText: 'TO DO',
                icon: const Icon(Icons.swap_horiz_sharp),
                onTap: () {},
              ),
              AppBarButton(
                iconText: 'TO DO',
                icon: const Icon(Icons.language_sharp),
                onTap: () {},
              ),
              AppBarButton(
                iconText: 'TO DO',
                icon: const Icon(Icons.list_alt_sharp),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:consumption_fuel_calculator/presentation/fonts/avenir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FuelSnackBar extends StatelessWidget {
  final String text;
  const FuelSnackBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SnackBar(
        width: width * 0.3,
        duration: const Duration(milliseconds: 1),
        backgroundColor: color.secondaryContainer,
        content: Text(
          text,
          style: Avenir(color: color.onSecondaryContainer, fontSize: 14),
        ));
  }
}

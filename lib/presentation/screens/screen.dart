// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:consumption_fuel_calculator/presentation/fonts/export.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FuelScreen extends StatelessWidget {
  const FuelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translates = AppLocalizations.of(context)!;
    final theme = FlexColorScheme();
    // final Color? color = theme.colorScheme?;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: theme.colorScheme?.surfaceVariant,
        appBar: AppBar(
          toolbarHeight: height * 0.04,
          title: Text(translates.app_name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    translates.volume,
                    style: Avenir(
                        color: theme.onBackground, fontSize: height * 0.01),
                  ),
                  Spacer(),
                  Expanded(
                    child: Container(
                      width: 500,
                      color: theme.primaryContainer,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style:
                            Segment7(color: theme.onBackground, fontSize: 50),
                        decoration: InputDecoration(
                          fillColor: theme.primaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Spacer()
                ],
              )
            ],
          ),
        ));
  }
}

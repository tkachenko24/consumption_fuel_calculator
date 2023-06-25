// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:consumption_fuel_calculator/presentation/fonts/export.dart';
import 'package:consumption_fuel_calculator/presentation/widgets/export.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FuelScreen extends StatelessWidget {
  const FuelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translates = AppLocalizations.of(context)!;
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      backgroundColor: color.onPrimary,
      appBar: AppBar(
        backgroundColor: color.primary,
        toolbarHeight: height * 0.07,
        title: Text(
          translates.app_name,
          style: Avenir(
            color: color.onPrimary,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Container(
          color: color.outline,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              15,
              15,
              400,
            ),
            child: Container(
              color: color.shadow,
              child: Padding(
                padding: EdgeInsets.all(
                  10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FuelRow(text: translates.volume),
                    FuelRow(text: translates.price),
                    FuelRow(text: translates.distance),
                    FuelRow(
                      text: translates.consumption,
                      lock: true,
                      cursor: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: FuelAppBar(),
    );
  }
}

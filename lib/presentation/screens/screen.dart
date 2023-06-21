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
        padding: EdgeInsets.only(
            top: height * 0.02, left: height * 0.02, right: height * 0.02),
        child: Container(
          color: color.outline,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              height * 0.03,
              height * 0.03,
              height * 0.03,
              height * 0.6,
            ),
            child: Container(
              color: color.shadow,
              child: Padding(
                padding: EdgeInsets.all(
                  height * 0.03,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FuelRow(text: translates.volume),
                    Spacer(),
                    FuelRow(text: translates.price),
                    Spacer(),
                    FuelRow(text: translates.consumption)
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

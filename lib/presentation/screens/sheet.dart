import 'package:flutter/material.dart';
import 'package:vehicle_consumption_calculator/presentation/widgets/app_button.dart';

class ConsumptionSheet extends StatelessWidget {
  const ConsumptionSheet(
      {super.key, required this.height, required this.color});
  final double height;
  final ColorScheme color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: AppButton(
            onTap: () {
              Navigator.pop(context);
            },
            backgroundColor: color.outline,
            borderColor: color.outline,
            color: color,
            height: height,
            icon: const Icon(Icons.cancel_sharp),
            iconColor: color.onSecondaryContainer,
            size: 0.04,
            tooltipText: '',
          ),
          body: Placeholder()),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:vehicle_consumption_calculator/presentation/export.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';

class ConsumptionScreen extends StatelessWidget {
  const ConsumptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translates = AppLocalizations.of(context)!;
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: color.onPrimary,
      appBar: AppBar(
        backgroundColor: color.primary,
        toolbarHeight: height * 0.07,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              translates.app_name,
              style: Gill(
                color: color.onPrimary,
                fontSize: height * 0.025,
              ),
            ),
            AppButton(
                icon: const Icon(Icons.info_sharp),
                onTap: () {},
                tooltipText: translates.info_tooltip,
                iconColor: color.primary,
                backgroundColor: color.onPrimary,
                borderColor: color.outline,
                size: 0.03)
          ],
        ),
      ),
      body: Pump(),
      bottomNavigationBar: ConsumptionAppBar(),
    );
  }
}

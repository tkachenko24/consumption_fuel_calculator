import 'package:consumption_fuel_calculator/presentation/fonts/avenir.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.iconText});
  final String iconText;
  final Widget icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(height * 0.001),
      child: InkWell(
        onTap: onTap,
        child: Container(
            width: width * 0.16,
            height: height * 0.1,
            decoration: BoxDecoration(
              color: color.inversePrimary,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Text(iconText,
                      style:
                          Avenir(color: color.shadow, fontSize: height * 0.02))
                ],
              ),
            )
            // IconButton(
            //   splashRadius: height * 0.1,
            //   color: color.inverseSurface,
            //   tooltip: tooltipText,
            //   icon: icon,
            //   onPressed: onTap,
            // ),
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton(
      {super.key,
      required this.tooltipText,
      required this.icon,
      required this.onTap});
  final String tooltipText;
  final Widget icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(height * 0.001),
      child: Container(
        decoration: BoxDecoration(
          color: color.inversePrimary,
        ),
        child: IconButton(
          splashRadius: height * 0.1,
          color: color.inverseSurface,
          tooltip: tooltipText,
          icon: icon,
          onPressed: onTap,
        ),
      ),
    );
  }
}

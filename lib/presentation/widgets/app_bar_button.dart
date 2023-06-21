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

    return Container(
      decoration: BoxDecoration(
        color: color.inversePrimary,
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Колір тіні
            blurRadius: 4, // Радіус розмиття тіні
            offset: Offset(0, 2), // Зсув тіні
          ),
        ],
      ),
      child: IconButton(
        tooltip: tooltipText,
        icon: icon,
        onPressed: onTap,
      ),
    );
  }
}

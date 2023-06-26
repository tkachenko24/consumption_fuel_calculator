import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.tooltipText});
  final String tooltipText;
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(height * 0.001),
      child: IconButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          enableFeedback: true,
          iconSize: MaterialStateProperty.all(height * 0.04),
          shadowColor: MaterialStatePropertyAll<Color>(color.shadow),
          shape: MaterialStateProperty.all<ContinuousRectangleBorder>(
              ContinuousRectangleBorder(
                  side: BorderSide(color: color.inversePrimary))),
          backgroundColor:
              MaterialStatePropertyAll<Color>(color.inversePrimary),
        ),
        splashRadius: height * 0.1,
        color: color.inverseSurface,
        tooltip: tooltipText,
        icon: icon,
        onPressed: onTap,
      ),
    );
  }
}

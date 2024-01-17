import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.tooltipText,
    required this.iconColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
    required this.height,
    required this.color,
    required this.isLoading,
  });
  final String tooltipText;
  final Widget icon;
  final Color iconColor, backgroundColor, borderColor;
  final ColorScheme color;
  final double size, height;
  final bool isLoading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height * 0.001),
      child: IconButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          enableFeedback: true,
          iconSize: MaterialStateProperty.all(height * size),
          shadowColor: MaterialStatePropertyAll<Color>(color.shadow),
          shape: MaterialStateProperty.all<ContinuousRectangleBorder>(
              ContinuousRectangleBorder(side: BorderSide(color: borderColor))),
          backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
        ),
        splashRadius: height * 0.1,
        color: iconColor,
        tooltip: tooltipText,
        icon: isLoading ? const CupertinoActivityIndicator() : icon,
        onPressed: onTap,
      ),
    );
  }
}

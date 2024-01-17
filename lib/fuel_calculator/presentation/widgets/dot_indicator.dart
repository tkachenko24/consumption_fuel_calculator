import 'package:vehicle_consumption_calculator/fuel_calculator/export.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.height,
    required this.color,
    required this.status,
  });
  final bool status;
  final double height;
  final ColorScheme color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceIn,
      margin: EdgeInsets.all(
        height * 0.02,
      ),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          boxShadow: List.filled(
              7,
              BoxShadow(
                  blurStyle: BlurStyle.solid,
                  blurRadius: 4,
                  color:
                      status ? color.tertiaryContainer : color.errorContainer)),
          shape: BoxShape.circle,
          color: status ? color.tertiaryContainer : color.errorContainer),
    );
  }
}

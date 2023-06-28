import 'package:vehicle_consumption_calculator/presentation/export.dart';

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
    return Container(
      margin: EdgeInsets.all(
        height * 0.02,
      ),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: status ? color.tertiaryContainer : color.errorContainer),
    );
  }
}

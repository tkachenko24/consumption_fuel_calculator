import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class PumpRow extends StatelessWidget {
  const PumpRow({
    super.key,
    required this.text,
    required this.unit,
    required this.translates,
    required this.status,
    required this.onChanged,
  });
  final void Function(String) onChanged;
  final AppLocalizations translates;
  final String unit;
  final String text;
  final bool status;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    const Color white = Colors.white;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.28,
            child: Text(
              "$text$unit",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: Gill(
                color: white,
                fontSize: height * 0.025,
              ),
            ),
          ),
          const Spacer(),
          Container(
            color: color.primary,
            width: width * 0.35,
            height: height * 0.07,
            child: Center(
              child: PumpInput(
                size: 0.045,
                height: height,
                color: color,
                readOnly: false,
                width: width,
                cursor: true,
                onChanged: onChanged,
              ),
            ),
          ),
          DotIndicator(
            height: height,
            color: color,
            status: status,
          ),
        ],
      ),
    );
  }
}

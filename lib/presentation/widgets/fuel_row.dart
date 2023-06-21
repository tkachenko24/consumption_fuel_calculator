import 'package:consumption_fuel_calculator/presentation/fonts/export.dart';
import 'package:flutter/material.dart';

class FuelRow extends StatelessWidget {
  const FuelRow({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    const Color white = Colors.white;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: width * 0.2,
          child: Text(
            text,
            overflow: TextOverflow.fade,
            style: Avenir(
              color: white,
              fontSize: height * 0.02,
            ),
          ),
        ),
        SizedBox(
          width: width * 0.4,
          height: height * 0.04,
          child: TextField(
            showCursor: true,
            cursorColor: color.shadow,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.number,
            style: Segment7(
              color: color.shadow,
              fontSize: height * 0.03,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: color.primary,
              isDense: false,
              counterText: '',
            ),
            maxLength: 8,
          ),
        ),
      ],
    );
  }
}

import 'package:consumption_fuel_calculator/presentation/fonts/export.dart';
import 'package:flutter/material.dart';

class FuelRow extends StatelessWidget {
  const FuelRow({
    super.key,
    this.lock,
    this.cursor,
    required this.text,
  });
  final String text;
  final bool? lock;
  final bool? cursor;

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
          height: 40,
          width: 130,
          child: Text(
            text,
            overflow: TextOverflow.fade,
            style: Avenir(
              color: white,
              fontSize: height * 0.02,
            ),
          ),
        ),
        Container(
          color: color.primary,
          width: 120,
          height: 50,
          child: TextField(
            readOnly: lock ?? false,
            showCursor: cursor,
            cursorColor: color.shadow,
            textAlign: TextAlign.end,
            keyboardType: TextInputType.number,
            style: Segment7(
              color: color.shadow,
              fontSize: height * 0.03,
            ),
            decoration: InputDecoration(
              hintText: '0.00',
              hintStyle: Segment7(
                color: color.shadow,
                fontSize: height * 0.03,
              ),
              // contentPadding: EdgeInsets.all(height * 0.01),
              border: InputBorder.none,
              counterText: '',
            ),
            maxLength: 6,
          ),
        ),
      ],
    );
  }
}

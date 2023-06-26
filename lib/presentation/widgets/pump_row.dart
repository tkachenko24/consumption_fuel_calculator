import 'package:vehicle_consumption_calculator/presentation/fonts/export.dart';
import 'package:flutter/material.dart';

class PumpRow extends StatelessWidget {
  const PumpRow({
    super.key,
    this.consumption,
    this.cursor,
    required this.text,
  });
  final String text;
  final bool? consumption;
  final bool? cursor;

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
          Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: Gill(
              color: white,
              fontSize: height * 0.025,
            ),
          ),
          Container(
            color: color.primary,
            width: width * 0.4,
            height: height * 0.07,
            child: Center(
              child: TextField(
                onTapOutside: (PointerDownEvent event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                readOnly: consumption ?? false,
                showCursor: cursor,
                cursorColor: color.shadow,
                textAlign: TextAlign.end,
                keyboardType: TextInputType.number,
                style: Segment7(
                  color: color.shadow,
                  fontSize: height * 0.05,
                ),
                decoration: InputDecoration(
                  hintText: '0.00',
                  hintStyle: Segment7(
                    color: color.shadow,
                    fontSize: height * 0.05,
                  ),
                  contentPadding: EdgeInsets.only(
                    right: height * 0.005,
                  ),
                  border: InputBorder.none,
                  counterText: '',
                ),
                maxLength: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

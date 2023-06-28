import 'package:flutter/services.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class PumpInput extends StatelessWidget {
  const PumpInput(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.readOnly,
      required this.size,
      required this.cursor,
      required this.controller,
      required this.onChanged});
  final bool readOnly;
  final bool cursor;
  final double height;
  final double width;
  final double size;
  final void Function(String) onChanged;
  final ColorScheme color;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.primary,
      margin: EdgeInsets.only(right: width * 0.02, left: width * 0.015),
      height: height * 0.1,
      child: Center(
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          cursorHeight: height * 0.05,
          textAlignVertical: TextAlignVertical.center,
          cursorOpacityAnimates: false,
          autocorrect: false,
          onTapOutside: (PointerDownEvent event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          readOnly: readOnly,
          showCursor: cursor,
          cursorColor: color.shadow,
          textAlign: TextAlign.end,
          keyboardType: TextInputType.number,
          style: Segment7(
            color: color.shadow,
            fontSize: height * size,
          ),
          decoration: InputDecoration(
            hintText: 0.0.toString(),
            hintStyle: Segment7(
              color: color.shadow,
              fontSize: height * size,
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
    );
  }
}

import 'package:flutter/services.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/screens/widgets/export.dart';

class PumpInput extends StatelessWidget {
  const PumpInput({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.readOnly,
    required this.size,
    required this.cursor,
    required this.onChanged,
    required this.textInputAction,
  });
  final bool readOnly, cursor;
  final double height, size, width;
  final void Function(String) onChanged;
  final ColorScheme color;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      cursorHeight: height * 0.05,
      textInputAction: textInputAction,
      textAlignVertical: TextAlignVertical.center,
      cursorOpacityAnimates: false,
      autocorrect: false,
      onTapOutside: (PointerDownEvent event) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      readOnly: readOnly,
      showCursor: cursor,
      cursorColor: color.shadow,
      textAlign: TextAlign.end,
      keyboardType: TextInputType.datetime,
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
        contentPadding: EdgeInsets.all(
          height * 0.005,
        ),
        border: InputBorder.none,
        counterText: '',
      ),
      maxLength: 5,
    );
  }
}

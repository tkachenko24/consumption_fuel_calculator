// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';

class Gill extends TextStyle {
  final Color? color;

  final double fontSize;

  const Gill({
    required this.color,
    required this.fontSize,
  });
}

class Segment7 extends TextStyle {
  @override
  final Color? color;
  @override
  final double? fontSize;

  const Segment7({required this.color, required this.fontSize});
  @override
  String? get fontFamily => "Segment7Standard";
}

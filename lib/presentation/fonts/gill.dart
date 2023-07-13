// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class Gill extends TextStyle {
  @override
  final Color? color;
  @override
  final double fontSize;

  const Gill({
    required this.color,
    required this.fontSize,
  });
}

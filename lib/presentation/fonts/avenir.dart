// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class Avenir extends TextStyle {
  @override
  final Color? color;
  @override
  final double fontSize;

  const Avenir({
    required this.color,
    required this.fontSize,
  });
  @override
  String? get fontFamily => "Avenir";
}

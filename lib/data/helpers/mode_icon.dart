import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ModeIconHelper {
  static Icon getModeIcon(FlexScheme mode) {
    switch (mode) {
      case FlexScheme.orangeM3:
        return const Icon(Icons.local_gas_station_sharp);
      case FlexScheme.cyanM3:
        return const Icon(Icons.ev_station_sharp);
      default:
        return const Icon(Icons.local_gas_station_sharp);
    }
  }
}

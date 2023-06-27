import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';

final scheme = Provider<FlexScheme>((ref) => ref.watch(modeStateProvider));
final flexSchemeLight =
    FlexColorScheme.light(scheme: FlexScheme.amber, useMaterial3: true);
final flexSchemeDark =
    FlexColorScheme.dark(scheme: FlexScheme.amber, useMaterial3: true);

final ThemeData theme = flexSchemeLight.toTheme;
final ThemeData darkTheme = flexSchemeDark.toTheme;

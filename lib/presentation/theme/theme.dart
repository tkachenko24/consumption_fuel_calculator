import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final flexSchemeLight =
    FlexColorScheme.light(scheme: FlexScheme.orangeM3, useMaterial3: true);
final flexSchemeDark =
    FlexColorScheme.dark(scheme: FlexScheme.orangeM3, useMaterial3: true);

final ThemeData theme = flexSchemeLight.toTheme;
final ThemeData darkTheme = flexSchemeDark.toTheme;

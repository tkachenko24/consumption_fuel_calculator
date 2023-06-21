import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final flexSchemeLight = FlexColorScheme.light(scheme: FlexScheme.gold);
final flexSchemeDark = FlexColorScheme.dark(scheme: FlexScheme.gold);

final ThemeData theme = flexSchemeLight.toTheme;
final ThemeData darkTheme = flexSchemeDark.toTheme;

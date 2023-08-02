import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/theme/export.dart';

final themeStateProvider =
    StateNotifierProvider<ThemeAppImpl, ThemeMode>((ref) {
  final themeRepo = ThemeAppImpl();
  themeRepo.loadSelectedTheme();
  return themeRepo;
});

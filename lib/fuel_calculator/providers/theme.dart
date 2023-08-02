import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/domain/export.dart';

final themeStateProvider =
    StateNotifierProvider<ThemeRepository, ThemeMode>((ref) {
  final themeRepo = ThemeRepository();
  themeRepo.loadSelectedTheme();
  return themeRepo;
});

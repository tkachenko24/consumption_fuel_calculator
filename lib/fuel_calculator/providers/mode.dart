import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/mode/export.dart';

final modeStateProvider = StateNotifierProvider<ModeAppImpl, FlexScheme>((ref) {
  final modeRepo = ModeAppImpl();
  modeRepo.loadSelectedMode();
  return modeRepo;
});

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:vehicle_consumption_calculator/domain/export.dart';

final modeStateProvider =
    StateNotifierProvider<ModeRepository, FlexScheme>((ref) {
  final modeRepo = ModeRepository();
  modeRepo.loadSelectedMode();
  return modeRepo;
});

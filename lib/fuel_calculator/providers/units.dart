import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/unit/export.dart';

final unitStateProvider = StateNotifierProvider<UnitAppImpl, bool>((ref) {
  final unitRepo = UnitAppImpl(true);
  unitRepo.loadSelectedUnit();
  return unitRepo;
});

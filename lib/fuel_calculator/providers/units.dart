import 'package:vehicle_consumption_calculator/domain/export.dart';

final unitStateProvider = StateNotifierProvider<UnitRepository, bool>((ref) {
  final unitRepo = UnitRepository(true);
  unitRepo.loadSelectedUnit();
  return unitRepo;
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnitRepository extends StateNotifier<bool> {
  UnitRepository(bool initialValue) : super(initialValue);

  static const String _unitKey = 'selected_unit';

  Future<void> switchUnit() async {
    state = !state;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_unitKey, state);
  }

  Future<void> loadSelectedUnit() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedUnit = prefs.getBool(_unitKey);

    if (selectedUnit != null) {
      state = selectedUnit;
    }
  }
}

final unitStateProvider = StateNotifierProvider<UnitRepository, bool>((ref) {
  final unitRepo = UnitRepository(true);
  unitRepo.loadSelectedUnit();
  return unitRepo;
});

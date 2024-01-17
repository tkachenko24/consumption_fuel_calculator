import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/unit/export.dart';

class UnitAppImpl extends StateNotifier<bool> implements UnitApp {
  UnitAppImpl(bool initialValue) : super(initialValue);
  static const String _unitKey = 'selected_unit';

  @override
  Future<void> change() async {
    state = !state;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_unitKey, state);
  }

  @override
  Future<void> loadSelectedUnit() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedUnit = prefs.getBool(_unitKey);

    if (selectedUnit != null) {
      state = selectedUnit;
    }
  }
}

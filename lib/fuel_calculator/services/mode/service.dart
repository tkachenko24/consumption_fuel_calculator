import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/mode/export.dart';

class ModeAppImpl extends StateNotifier<FlexScheme> implements ModeApp {
  ModeAppImpl() : super(FlexScheme.orangeM3);

  static const String _modeKey = 'selected_mode';

  @override
  Future<void> change() async {
    if (state == FlexScheme.orangeM3) {
      state = FlexScheme.cyanM3;
    } else {
      state = FlexScheme.orangeM3;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_modeKey, state.toString());
  }

  @override
  Future<void> loadSelectedMode() async {
    final prefs = await SharedPreferences.getInstance();
    final modeString = prefs.getString(_modeKey);

    if (modeString != null && modeString.isNotEmpty) {
      state = FlexScheme.values.firstWhere(
        (mode) => mode.toString() == modeString,
        orElse: () => state,
      );
    }
  }
}

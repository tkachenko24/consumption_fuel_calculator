import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeRepository extends StateNotifier<FlexScheme> {
  ModeRepository() : super(FlexScheme.orangeM3);

  static const String _modeKey = 'selected_mode';

  Future<void> switchMode() async {
    if (state == FlexScheme.orangeM3) {
      state = FlexScheme.cyanM3;
    } else {
      state = FlexScheme.orangeM3;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_modeKey, state.toString());
  }

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

final modeStateProvider =
    StateNotifierProvider<ModeRepository, FlexScheme>((ref) {
  final modeRepo = ModeRepository();
  modeRepo.loadSelectedMode();
  return modeRepo;
});

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeRepository extends StateNotifier<FlexScheme> {
  ModeRepository() : super(FlexScheme.orangeM3);
  FlexScheme switchMode() {
    if (state == FlexScheme.orangeM3) {
      return state = FlexScheme.cyanM3;
    } else {
      return state = FlexScheme.orangeM3;
    }
  }
}

final modeStateProvider =
    StateNotifierProvider<ModeRepository, FlexScheme>((ref) {
  return ModeRepository();
});

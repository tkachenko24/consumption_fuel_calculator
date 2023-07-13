import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnitRepository extends StateNotifier<bool> {
  UnitRepository(bool initialValue)
      : super(
            initialValue); // metric - is true, imperial - must fall ... oh sorry, imperial - false

  void switchUnit() {
    state = !state;
  }
}

final unitStateProvider = StateNotifierProvider<UnitRepository, bool>((ref) {
  return UnitRepository(true);
});

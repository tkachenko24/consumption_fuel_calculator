import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';

abstract interface class DataBase {
  void save(
    WidgetRef ref,
  );
  List<Map<String, String>> load(
    WidgetRef ref,
  );
  Future<void> delete(
    int index,
    WidgetRef ref,
  );
}

import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';

abstract class DataBase {
  Future<void> saveData(WidgetRef ref);
  Future<void> loadSavedData(WidgetRef ref);
  Future<void> deleteSavedData(int index, WidgetRef ref);
}

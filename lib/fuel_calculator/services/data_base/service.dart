import 'package:vehicle_consumption_calculator/fuel_calculator/export.dart';
import 'dart:convert';

class DataBaseImpl implements DataBase {
  final AlwaysAliveRefreshable<Future<SharedPreferences>> prefs;
  DataBaseImpl({required this.prefs});

  static const String key = 'data_base';

  @override
  void save(
    WidgetRef ref,
  ) async {
    final prefs = await ref.watch(storageProvider.future);
    List<String> storageList = prefs.getStringList(key) ?? [];
    String dataToSave = jsonEncode(ref.watch(fuelDataStateProvider).toMap());
    storageList.add(dataToSave);
    prefs.setStringList(key, storageList);
  }

  @override
  List<Map<String, String>> load(
    WidgetRef ref,
  ) {
    // List<String>? rawList = prefs?.getStringList(key);
    // List<Map<String, String>> cleanList = jsonDecode(rawList.toString());
    return [];
  }

  @override
  Future<void> delete(
    int index,
    WidgetRef ref,
  ) async {
    // String rawData = await prefs.then((value) => value.getString(key) ?? '');
    // List<FuelData> dataList = jsonDecode(rawData);
    // dataList.removeAt(index);
    // String value = jsonEncode(dataList);
    // prefs.then((db) => db.setString(key, value));
  }
}

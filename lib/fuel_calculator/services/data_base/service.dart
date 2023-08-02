import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/models/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/data_base/interface.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/math/export.dart';

class DataBaseImpl implements DataBase {
  final DataBaseModel db;

  DataBaseImpl(this.db);
  @override
  Future<void> saveData(
    WidgetRef ref,
  ) async {
    final ConsumptionCalculator calculator = ConsumptionCalculatorImpl();
    final fuelData = ref.watch(fuelDataStateProvider),
        now = DateTime.now(),
        formatter = DateFormat('dd.MM.yy HH:mm'),
        formattedDate = formatter.format(now);
    double consumption = calculator.calculateConsumption(
            fuelData.fuelVolume, fuelData.distance, fuelData.price, ref),
        cost = calculator.calculateCost(fuelData.price, consumption, ref);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    updateData(String key, dynamic value) async {
      final List<String> data = prefs.getStringList(key) ?? [];
      data.add(value.toString());
      await prefs.setStringList(key, data);
    }

    await updateData('dates', formattedDate);
    await updateData('volumes', fuelData.fuelVolume);
    await updateData('prices', fuelData.price);
    await updateData('distances', fuelData.distance);
    await updateData('consumptions', consumption.toStringAsFixed(2));
    await updateData('costs', cost.toStringAsFixed(2));
  }

  @override
  Future<void> loadSavedData(WidgetRef ref) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    db.dates = prefs.getStringList('dates') ?? [];
    db.volumes = prefs.getStringList('volumes') ?? [];
    db.prices = prefs.getStringList('prices') ?? [];
    db.distances = prefs.getStringList('distances') ?? [];
    db.consumptions = prefs.getStringList('consumptions') ?? [];
    db.costs = prefs.getStringList('costs') ?? [];
  }

  @override
  Future<void> deleteSavedData(int index, WidgetRef ref) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    db.dates.removeAt(index);
    db.volumes.removeAt(index);
    db.prices.removeAt(index);
    db.distances.removeAt(index);
    db.consumptions.removeAt(index);
    db.costs.removeAt(index);

    await prefs.setStringList('dates', db.dates);
    await prefs.setStringList('volumes', db.volumes);
    await prefs.setStringList('prices', db.prices);
    await prefs.setStringList('distances', db.distances);
    await prefs.setStringList('consumptions', db.consumptions);
    await prefs.setStringList('costs', db.costs);
  }
}

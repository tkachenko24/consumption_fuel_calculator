import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_consumption_calculator/domain/export.dart';

class DataBase {
  List<String> dates, volumes, prices, distances, consumptions, costs;

  DataBase({
    required this.dates,
    required this.volumes,
    required this.prices,
    required this.distances,
    required this.consumptions,
    required this.costs,
  });

  DataBase copyWith({
    List<String>? dates,
    volumes,
    prices,
    distances,
    consumptions,
    costs,
  }) {
    return DataBase(
      dates: dates ?? this.dates,
      volumes: volumes ?? this.volumes,
      prices: prices ?? this.prices,
      distances: distances ?? this.distances,
      consumptions: consumptions ?? this.consumptions,
      costs: costs ?? this.costs,
    );
  }

  Future<void> saveData(WidgetRef ref) async {
    final fuelData = ref.watch(fuelDataStateProvider),
        now = DateTime.now(),
        formatter = DateFormat('dd.MM.yy HH:mm'),
        formattedDate = formatter.format(now);
    double consumption = calculateConsumption(
            fuelData.fuelVolume, fuelData.distance, fuelData.price, ref),
        cost = calculateCost(fuelData.price, consumption, ref);
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

  Future<void> loadSavedData(WidgetRef ref) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dates = prefs.getStringList('dates') ?? [];
    volumes = prefs.getStringList('volumes') ?? [];
    prices = prefs.getStringList('prices') ?? [];
    distances = prefs.getStringList('distances') ?? [];
    consumptions = prefs.getStringList('consumptions') ?? [];
    costs = prefs.getStringList('costs') ?? [];
  }

  Future<void> deleteSavedData(int index, WidgetRef ref) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dates.removeAt(index);
    volumes.removeAt(index);
    prices.removeAt(index);
    distances.removeAt(index);
    consumptions.removeAt(index);
    costs.removeAt(index);

    await prefs.setStringList('dates', dates);
    await prefs.setStringList('volumes', volumes);
    await prefs.setStringList('prices', prices);
    await prefs.setStringList('distances', distances);
    await prefs.setStringList('consumptions', consumptions);
    await prefs.setStringList('costs', costs);
  }
}

final dataBaseStateProvider = StateProvider<DataBase>((ref) => DataBase(
    consumptions: [],
    costs: [],
    dates: [],
    distances: [],
    prices: [],
    volumes: []));

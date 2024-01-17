import 'package:vehicle_consumption_calculator/fuel_calculator/presentation/export.dart';

final dataBaseStateProvider = StateProvider<DataBaseModel>((ref) =>
    DataBaseModel(
        consumptions: [],
        costs: [],
        dates: [],
        distances: [],
        prices: [],
        volumes: []));

final unitStateProvider = StateNotifierProvider<UnitAppImpl, bool>((ref) {
  final unitRepo = UnitAppImpl(true);
  unitRepo.loadSelectedUnit();
  return unitRepo;
});

final fuelDataStateProvider =
    StateProvider<FuelData>((ref) => FuelData(dateTime: DateTime.now()));

final calculatorProvider =
    Provider<Calculator>((ref) => CalculatorImplementation());

final dataBaseProvider =
    Provider<DataBase>((ref) => DataBaseImpl(prefs: storageProvider.future));

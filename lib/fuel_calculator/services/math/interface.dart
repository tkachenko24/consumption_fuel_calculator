import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';

abstract interface class Calculator {
  consumption(double fuelVolume, double distance, double price, WidgetRef ref);
  cost(double price, double calculateConsumption, WidgetRef ref);
}

import 'package:vehicle_consumption_calculator/domain/export.dart';

abstract class ConsumptionCalculator {
  calculateConsumption(
      double fuelVolume, double distance, double price, WidgetRef ref);
  calculateCost(double price, double calculateConsumption, WidgetRef ref);
}

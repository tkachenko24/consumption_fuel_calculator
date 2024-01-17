import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'export.dart';

class CalculatorImplementation implements Calculator {
  @override
  double consumption(
      double fuelVolume, double distance, double price, WidgetRef ref) {
    if (distance == 0 || fuelVolume == 0 || price == 0) {
      return 0;
    }
    if (ref.watch(unitStateProvider)) {
      return (fuelVolume / distance) * 100;
    } else {
      return distance / fuelVolume;
    }
  }

  @override
  double cost(double price, double calculateConsumption, WidgetRef ref) {
    if (calculateConsumption == 0 || price == 0) {
      return 0;
    } else {
      return (calculateConsumption / 100) * price;
    }
  }
}

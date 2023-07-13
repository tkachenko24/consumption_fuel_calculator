import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/domain/repository/unit_repository.dart';

class FuelData {
  double distance;
  double price;
  double fuelVolume;

  FuelData({
    this.distance = 0.0,
    this.price = 0.0,
    this.fuelVolume = 0.0,
  });

  FuelData copyWith({
    double? distance,
    double? price,
    double? fuelVolume,
  }) {
    return FuelData(
      fuelVolume: fuelVolume ?? this.fuelVolume,
      price: price ?? this.price,
      distance: distance ?? this.distance,
    );
  }
}

double calculateConsumption(
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

double calculateCost(double price, double calculateConsumption, WidgetRef ref) {
  if (calculateConsumption == 0 || price == 0) {
    return 0;
  } else {
    return (calculateConsumption / 100) * price;
  }
}

final fuelDataStateProvider = StateProvider<FuelData>((ref) => FuelData());

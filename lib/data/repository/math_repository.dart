import 'package:flutter_riverpod/flutter_riverpod.dart';

class FuelData {
  double fuelVolume;
  double distance;

  FuelData({
    this.fuelVolume = 0.0,
    this.distance = 0.0,
  });

  FuelData copyWith({
    double? fuelVolume,
    double? distance,
  }) {
    return FuelData(
      fuelVolume: fuelVolume ?? this.fuelVolume,
      distance: distance ?? this.distance,
    );
  }
}

double calculateConsumption(double fuelVolume, double distance) {
  if (distance == 0) {
    return 0;
  }
  return (fuelVolume / distance) * 100;
}

final fuelDataStateProvider = StateProvider<FuelData>((ref) => FuelData());

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

class FuelData {
  DateTime dateTime;
  double distance;
  double price;
  double fuelVolume;
  double consumption;
  double cost;

  FuelData({
    required this.dateTime,
    this.distance = 0.0,
    this.price = 0.0,
    this.fuelVolume = 0.0,
    this.consumption = 0.0,
    this.cost = 0.0,
  });

  FuelData copyWith({
    DateTime? dateTime,
    double? distance,
    double? price,
    double? fuelVolume,
    double? consumption,
    double? cost,
  }) {
    return FuelData(
      dateTime: dateTime ?? this.dateTime,
      fuelVolume: fuelVolume ?? this.fuelVolume,
      price: price ?? this.price,
      distance: distance ?? this.distance,
      consumption: consumption ?? this.consumption,
      cost: cost ?? this.cost,
    );
  }

  Map toMap() {
    return {
      'dateTime': dateTime.toString(),
      'distance': distance.toString(),
      'price': price.toString(),
      'fuelVolume': fuelVolume.toString(),
      'consumption': consumption.toString(),
      'cost': cost.toString(),
    };
  }
}

class DataBaseModel {
  List<String> dates, volumes, prices, distances, consumptions, costs;

  DataBaseModel({
    required this.dates,
    required this.volumes,
    required this.prices,
    required this.distances,
    required this.consumptions,
    required this.costs,
  });

  DataBaseModel copyWith({
    List<String>? dates,
    volumes,
    prices,
    distances,
    consumptions,
    costs,
  }) {
    return DataBaseModel(
      dates: dates ?? this.dates,
      volumes: volumes ?? this.volumes,
      prices: prices ?? this.prices,
      distances: distances ?? this.distances,
      consumptions: consumptions ?? this.consumptions,
      costs: costs ?? this.costs,
    );
  }
}

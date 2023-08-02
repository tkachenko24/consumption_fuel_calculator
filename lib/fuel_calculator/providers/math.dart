import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/domain/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/models/export.dart';

final fuelDataStateProvider = StateProvider<FuelData>((ref) => FuelData());

import 'package:vehicle_consumption_calculator/data/export.dart';

class ThemeUseCase {
  final ConsumptionRepository repository;

  ThemeUseCase(this.repository);

  void switchTheme() {
    return repository.switchTheme();
  }
}

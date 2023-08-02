import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:vehicle_consumption_calculator/fuel_calculator/components/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/providers/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/screens/widgets/export.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/data_base/interface.dart';
import 'package:vehicle_consumption_calculator/fuel_calculator/services/math/export.dart';

class ConsumptionSheet extends ConsumerStatefulWidget {
  const ConsumptionSheet({
    Key? key,
    required this.height,
    required this.color,
    required this.translates,
    this.calculator,
    this.db,
  }) : super(key: key);

  final AppLocalizations translates;
  final double height;
  final ColorScheme color;
  final ConsumptionCalculator? calculator;
  final DataBase? db;

  @override
  ConsumptionSheetState createState() => ConsumptionSheetState();
}

void showConsumptionSheet(
    context, WidgetRef ref, color, height, translates, DataBase? db) {
  db?.loadSavedData(ref);
  showModalBottomSheet(
    useSafeArea: true,
    elevation: 10,
    backgroundColor: color.onPrimary,
    context: context,
    isScrollControlled: true,
    shape: const ContinuousRectangleBorder(),
    builder: (context) {
      return ConsumptionSheet(
        translates: translates,
        height: height,
        color: color,
      );
    },
  );
}

class ConsumptionSheetState extends ConsumerState<ConsumptionSheet> {
  void deleteItem(
    int index,
    WidgetRef ref,
    DataBase? db,
  ) {
    db?.deleteSavedData(index, ref);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tableGill =
        Gill(color: widget.color.onBackground, fontSize: widget.height * 0.019);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: AppButton(
        onTap: () {
          Navigator.pop(context);
        },
        backgroundColor: widget.color.outline,
        borderColor: widget.color.outline,
        color: widget.color,
        height: widget.height,
        icon: const Icon(Icons.cancel_sharp),
        iconColor: widget.color.onSecondaryContainer,
        size: 0.04,
        tooltipText: '',
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            final dbw = ref.watch(dataBaseStateProvider);
            final unit = ref.watch(unitStateProvider);
            final mode = ref.watch(modeStateProvider) == FlexScheme.orangeM3;
            return Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(
                style: BorderStyle.none,
                color: widget.color.shadow,
                width: 0.05,
              ),
              children: [
                TableRow(
                  children: [
                    Text(
                      widget.translates.date,
                      style: tableGill,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      mode
                          ? unit
                              ? widget.translates.litres
                              : widget.translates.gallons
                          : widget.translates.kilowatts,
                      style: tableGill,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.translates.price,
                      style: tableGill,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      unit
                          ? widget.translates.kilometers
                          : widget.translates.miles,
                      style: tableGill,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      unit
                          ? widget.translates.metric_consumption(mode
                              ? widget.translates.litres
                              : widget.translates.kilowatts)
                          : widget.translates.imperial_consumption(mode
                              ? widget.translates.gallons
                              : widget.translates.kilowatts),
                      style: tableGill,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.translates.price_per(
                        unit
                            ? widget.translates.kilometers
                            : widget.translates.miles,
                      ),
                      style: tableGill,
                      textAlign: TextAlign.center,
                    ),
                    const Text(""),
                  ],
                ),
                ...List.generate(dbw.dates.length, (index) {
                  final date = dbw.dates[index];
                  final volume = dbw.volumes[index];
                  final price = dbw.prices[index];
                  final distance = dbw.distances[index];
                  final consumption = dbw.consumptions[index];
                  final cost = dbw.costs[index];

                  return TableRow(
                    children: [
                      Text(
                        date,
                        style: tableGill,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        volume,
                        style: tableGill,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        price,
                        style: tableGill,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        distance,
                        style: tableGill,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        consumption,
                        style: tableGill,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        cost,
                        style: tableGill,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppButton(
                            icon: const Icon(Icons.delete_sharp),
                            onTap: () => deleteItem(index, ref, widget.db),
                            tooltipText: widget.translates.delete,
                            iconColor: widget.color.background,
                            backgroundColor: widget.color.error,
                            borderColor: widget.color.error,
                            size: 0.03,
                            height: widget.height,
                            color: widget.color),
                      )
                    ],
                  );
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}

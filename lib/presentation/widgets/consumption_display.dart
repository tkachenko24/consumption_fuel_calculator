import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class ConsumptionDisplay extends StatelessWidget {
  const ConsumptionDisplay({
    super.key,
    required this.height,
    required this.color,
    required this.width,
    required this.translates,
  });

  final double height;
  final ColorScheme color;
  final double width;
  final AppLocalizations translates;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.09),
      padding: EdgeInsets.all(height * 0.02),
      color: color.shadow,
      height: height * 0.2,
      width: width * 0.7,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(builder: (context, ref, child) {
              final unit = ref.watch(unitStateProvider);
              return Text(
                "${translates.consumption}, ${unit ? translates.metric_consumption : translates.imperial_consumption}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: Gill(
                  color: Colors.white,
                  fontSize: height * 0.025,
                ),
              );
            }),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: color.primary,
                    margin: EdgeInsets.only(
                        right: width * 0.02, left: width * 0.015),
                    height: height * 0.1,
                    child: Center(
                      child: TextField(
                        onTapOutside: (PointerDownEvent event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        readOnly: true,
                        cursorColor: color.shadow,
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        style: Segment7(
                          color: color.shadow,
                          fontSize: height * 0.03,
                        ),
                        decoration: InputDecoration(
                          hintText: '00.00',
                          hintStyle: Segment7(
                            color: color.shadow,
                            fontSize: height * 0.07,
                          ),
                          contentPadding: EdgeInsets.only(
                              top: height * 0.015, right: height * 0.01),
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        maxLength: 6,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    enableFeedback: true,
                    iconSize: MaterialStateProperty.all(height * 0.04),
                    shadowColor: MaterialStatePropertyAll<Color>(color.shadow),
                    shape: MaterialStateProperty.all<ContinuousRectangleBorder>(
                        ContinuousRectangleBorder(
                            side: BorderSide(color: color.outline))),
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(color.outline),
                  ),
                  splashRadius: height * 0.1,
                  color: color.onSecondaryContainer,
                  tooltip: "tooltipText",
                  icon: const Icon(Icons.save_sharp),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

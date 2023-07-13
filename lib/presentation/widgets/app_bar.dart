import 'package:vehicle_consumption_calculator/data/export.dart';
import 'package:vehicle_consumption_calculator/presentation/export.dart';

class ConsumptionTopAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConsumptionTopAppBar({
    super.key,
    required this.color,
    required this.height,
    required this.translates,
  });

  final ColorScheme color;
  final double height;
  final AppLocalizations translates;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color.primary,
      toolbarHeight: height * 0.07,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translates.app_name,
            style: Gill(
              color: color.onPrimary,
              fontSize: height * 0.022,
            ),
          ),
          AppButton(
            icon: const Icon(Icons.info_sharp),
            onTap: () {},
            tooltipText: translates.info_tooltip,
            iconColor: color.primary,
            backgroundColor: color.onPrimary,
            borderColor: color.outline,
            size: 0.03,
            color: color,
            height: height,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height * 0.07);
}

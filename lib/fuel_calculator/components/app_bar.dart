import 'package:vehicle_consumption_calculator/fuel_calculator/export.dart';

class ConsumptionTopAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConsumptionTopAppBar({
    super.key,
    required this.color,
    required this.height,
    required this.translates,
    required this.info,
  });

  final ColorScheme color;
  final double height;
  final AppLocalizations translates;
  final bool info;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color.primary,
      toolbarHeight: height * 0.07,
      automaticallyImplyLeading: false,
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
          !info
              ? AppButton(
                  icon: const Icon(Icons.info_sharp),
                  onTap: () {
                    Navigator.pushNamed(context, '/info');
                  },
                  tooltipText: translates.info_tooltip,
                  iconColor: color.primary,
                  backgroundColor: color.onPrimary,
                  borderColor: color.outline,
                  size: 0.03,
                  color: color,
                  height: height,
                )
              : AppButton(
                  icon: const Icon(Icons.arrow_back_sharp),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  tooltipText: translates.back_tooltip,
                  iconColor: color.primary,
                  backgroundColor: color.onPrimary,
                  borderColor: color.outline,
                  size: 0.03,
                  height: height,
                  color: color)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height * 0.07);
}

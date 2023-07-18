import 'package:vehicle_consumption_calculator/presentation/export.dart';
import 'package:vehicle_consumption_calculator/data/export.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translates = AppLocalizations.of(context)!,
        color = Theme.of(context).colorScheme;
    var height = MediaQuery.of(context).size.height,
        title = height * 0.02,
        description = height * 0.015;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: color.onPrimary,
        appBar: ConsumptionTopAppBar(
          color: color,
          translates: translates,
          height: height,
          info: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InfoDivider(height: height),
                  Text(
                    translates.about_title,
                    style: TextStyle(
                        color: color.primary,
                        fontSize: title,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  InfoDivider(height: height),
                  Text(
                    translates.about_description,
                    style:
                        TextStyle(color: color.primary, fontSize: description),
                    textAlign: TextAlign.center,
                  ),
                  InfoDivider(height: height),
                  Text(
                    translates.usage_title,
                    style: TextStyle(
                        color: color.primary,
                        fontSize: title,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  InfoDivider(height: height),
                  Text(
                    translates.usage_description,
                    style:
                        TextStyle(color: color.primary, fontSize: description),
                    textAlign: TextAlign.center,
                  ),
                  InfoDivider(height: height),
                  Text(
                    translates.data_title,
                    style: TextStyle(
                        color: color.primary,
                        fontSize: title,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  InfoDivider(height: height),
                  Text(
                    translates.data_description,
                    style:
                        TextStyle(color: color.primary, fontSize: description),
                    textAlign: TextAlign.center,
                  ),
                  InfoDivider(height: height),
                  Text(
                    translates.buttons_title,
                    style: TextStyle(
                        color: color.primary,
                        fontSize: title,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  InfoDivider(height: height),
                  Text(
                    translates.buttons_description,
                    style:
                        TextStyle(color: color.primary, fontSize: description),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class InfoDivider extends StatelessWidget {
  const InfoDivider({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.02,
      child: const Divider(),
    );
  }
}

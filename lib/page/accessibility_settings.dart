import 'package:flutter/material.dart';
import 'package:home/theme_provider.dart';
import '../model/my_flutter_app_icons.dart';
import 'package:flutter/foundation.dart';

class AccessibilitySettings extends StatefulWidget {
  const AccessibilitySettings({Key? key}) : super(key: key);

  @override
  State<AccessibilitySettings> createState() => AccessibilitySettingsState();
}
@visibleForTesting
class AccessibilitySettingsState extends State<AccessibilitySettings> {
  @visibleForTesting
  late List<bool> selections;
  @visibleForTesting
  late ThemeProvider provider;
  @visibleForTesting
  late Map args;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    args = (
        ModalRoute.of(context)?.settings.arguments ?? <String, ThemeProvider>{}
    ) as Map;

    try {
      provider = args['currentTheme'];
    } catch(e) {
      provider = ThemeProvider();
    }

    setSelections();


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.075),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(MyFlutterApp.back),
                    iconSize: 40.0,
                  ),
                ],
              ),

              SizedBox(height: height/40,),

              Row(
                children: [
                  Text(
                    'Set Theme',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),

              SizedBox(height: height/4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    key: const Key('Toggle'),
                    onPressed: (int index) {
                      (index == 0) ?
                        provider.setTheme('light') : provider.setTheme('dark');
                    },

                    isSelected: selections,
                    constraints: BoxConstraints(
                      minWidth: width/4,
                      minHeight: width/4,
                    ),
                    children: const [
                      Icon(Icons.sunny),
                      Icon(Icons.dark_mode),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @visibleForTesting
  void setSelections() {
    (provider.getTheme() == 'light') ?
      selections = [true, false] : selections = [false, true];
  }


}
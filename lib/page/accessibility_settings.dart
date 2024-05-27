import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home/theme_provider.dart';

import '../model/my_flutter_app_icons.dart';

class AccessibilitySettings extends StatefulWidget {

  @override
  State<AccessibilitySettings> createState() => _AccessibilitySettingsState();
}

class _AccessibilitySettingsState extends State<AccessibilitySettings> {
  late List<bool> _selections;

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ?? <String, ThemeProvider>{}) as Map;
    ThemeProvider provider = args['currentTheme'];
    String currentTheme = provider.getTheme();
    if (currentTheme == 'light')
      _selections = [true, false];
    else
      _selections = [false, true];


    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
                    icon: Icon(MyFlutterApp.back),
                    iconSize: 40.0,
                    //color: AppColors.primary,
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
                    onPressed: (int index) {
                      if (index == 0)
                        provider.setTheme('light');
                      else
                        provider.setTheme('dark');
                    },

                    isSelected: _selections,
                    constraints: BoxConstraints(
                      minWidth: width/3,
                      minHeight: width/3,
                    ),
                    children: [
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
}
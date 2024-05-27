import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/my_flutter_app_icons.dart';

class CopingToolbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  ),

                ],
              ),

              SizedBox(height: height/40,),

              Row(
                children: [
                  Text(
                    'Contents',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),

              SizedBox(height: height/15),

              Expanded(
                child: ListView(
                  children: [
                    OutlinedButton.icon(
                  icon: Icon(Icons.sticky_note_2_outlined),
                  label: Text(
                    'Cancer Types',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cancer_types_info_booklets');
                  },
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.sticky_note_2_outlined),
                  label: Text(
                    'Cancer Treatments',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cancer_treatments_info_booklets');
                  },
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.sticky_note_2_outlined),
                  label: Text(
                    'Living With Cancer',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/living_with_cancer_info_booklets');
                  },
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.sticky_note_2_outlined),
                  label: Text(
                    'After Cancer Treatment',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/after_cancer_treatment_info_booklets');
                  },
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.phone),
                  label: Text(
                    'Support and Services',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/support_contacts');
                  },
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.question_mark_outlined),
                  label: Text(
                    'Questions to Ask',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/questions');
                  },
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.chair),
                  label: Text(
                    'Relaxation and Meditation',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: () async {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,]
                    );
                    await Navigator.pushNamed(context, '/relaxation');
                  },
                ),
                  ],
                ),
              )



              /*



                      ],
                    ),
                  ),
                ]

               */

                  ]))));
  }
}
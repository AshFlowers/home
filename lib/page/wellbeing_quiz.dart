import 'package:flutter/material.dart';
import 'package:home/themes.dart';
import '../model/my_flutter_app_icons.dart';

class WellbeingQuiz extends StatefulWidget {

  @override
  State<WellbeingQuiz> createState() => _WellbeingQuizState();
}

class _WellbeingQuizState extends State<WellbeingQuiz> {
  List<double> values = [300, 300, 300, 300 ,300];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.075),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Wellbeing Quiz',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ]
              ),


              Row(
                  children: [
                    Flexible(
                      child: Text(
                        'How would you rate your overall emotional wellbeing for this month?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ]
              ),

              Slider(
                  value: values[0],
                  divisions: 400,
                  min: 100,
                  max: 500,
                  activeColor: AppColors.primary,
                  inactiveColor: Colors.grey,
                  onChanged: (value) => setState(() => this.values[0] = value),
              ),


              Row(
                  children: [
                    Flexible(
                      child: Text(
                        'How satisfied are you with your health efforts (eg.'
                        'exercise, meditation or anything else that promotes '
                        'your health) over this month?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ]
              ),


              Slider(
                value: values[1],
                divisions: 400,
                min: 100,
                max: 500,
                activeColor: AppColors.primary,
                inactiveColor: Colors.grey,
                onChanged: (value) => setState(() => this.values[1] = value),
              ),

              Row(
                children: [
                  Flexible(
                    child: Text(
                      'How satisfied are you with the support you received '
                      'this week?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ]
              ),
              Slider(
                value: values[2],
                divisions: 400,
                min: 100,
                max: 500,
                activeColor: AppColors.primary,
                inactiveColor: Colors.grey,
                onChanged: (value) => setState(() => this.values[2] = value),
              ),


              Row(
                  children: [
                    Flexible(
                      child: Text(
                        'How connected do you feel within your relationships?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ]
              ),
              Slider(
                value: values[3],
                divisions: 400,
                min: 100,
                max: 500,
                activeColor: AppColors.primary,
                inactiveColor: Colors.grey,
                onChanged: (value) => setState(() => this.values[3] = value),
              ),


              Row(
                children: [
                  Flexible(
                    child: Text(
                      'How would you rate your engagement with enjoyable '
                      'activities such as hobbies?',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ]
              ),
              Slider(
                value: values[4],
                divisions: 400,
                min: 100,
                max: 500,
                activeColor: AppColors.primary,
                inactiveColor: Colors.grey,
                onChanged: (value) => setState(() => this.values[4] = value),
              ),

              ElevatedButton(
                onPressed: () {
                  double sum = 0;

                  for(double value in values) {
                    sum += value;
                  }

                  double score = sum / values.length / 100;

                  Navigator.pop(context, {'score' : score});
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Theme.of(context).highlightColor),
                ),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }
}
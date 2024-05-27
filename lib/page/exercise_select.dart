import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExerciseSelect extends StatefulWidget {
  @override
  State<ExerciseSelect> createState() => _ExerciseSelectState();
}

class _ExerciseSelectState extends State<ExerciseSelect> {
  final List aerobic = [

  ];

  final List strength = [
    'Standing wall push-up',
    'Modified knee push-up',
    'Calf-raise',
    'Standing row',
    'Chair raise',
    'Wall squat',
    'Shoulder press',
    'Upright row',
    'Biceps Curl',
    'Clamshell',
    'Pelvic tilt',
    'Bird dog',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final List types = arguments['types'];
    final int typeIndex = arguments['index'];
    final title = types[typeIndex];

    final List exercises = [
      aerobic,
      strength,
    ];

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
                    icon: Icon(Icons.arrow_circle_left_outlined),
                    iconSize: 40.0,
                    color: Colors.teal[500],
                  ),

                ],
              ),
              Row(
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),


                  ]
              ),

              Expanded(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                    itemCount: exercises[typeIndex].length,
                    itemBuilder: (context, index, realIndex) {
                      return Text(exercises[typeIndex][index]);
                    },
                  ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [buildIndicator(exercises[typeIndex])],
              ),

              SizedBox(height: 50.0,),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(List exercise) => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: exercise.length,
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Exercise extends StatefulWidget {
  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List types = [
      'Aerobic and cardio exercise',
      'Strength and resistance training',
      'Flexibility exercises',
      'Balance exercises',
      'Pelvic floor exercises',
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
              Expanded(
                child: ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/exercise_select',
                          arguments: {
                            'types' : types,
                            'index' : index,
                          },
                        );
                      },
                      child: Container(
                        height: 50.0,
                        child: Card(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: Colors.teal.shade500, width: 2),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      types[index],
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }

}

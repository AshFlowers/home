import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AfterCancerTreatment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List types = [
      'Arm and shoulder exercises after surgery',
      'Breast prostheses and reconstruction',
      'Facing end of life',
      'Living well after cancer',
      'On the road to recovery',
      'Sexuality, intimacy and cancer',
      'Understanding grief',
      'Understanding lymphoedema',
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
                        'After Cancer Treatment Info Booklets',
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),


                  ]
              ),
              SizedBox(height: 10.0,),
              Expanded(
                child: ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {print('pressed ${types[index]} pdf');},
                      child: Container(
                        height: 90,
                        child: Card(
                          color: Colors.grey[200],
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      types[index],
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          letterSpacing: 1.0
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                  Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.teal[500],
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
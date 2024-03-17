import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LivingWithCancer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List types = [
      'Cancer and your finances',
      'Cancer care and your rights',
      'Cancer in the school community',
      'Cancer support groups',
      'Cancer, work and you',
      'Caring for someone with cancer',
      'Living with advanced cancer',
      'Emotions and cancer',
      'Fertility and cancer',
      'Understanding cancer pain',
      'Understanding rare and less common cancers',
      'Understanding secondary liver cancer',
      'Talking to kids about cancer',

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
                        'Living with Cancer Info Booklets',
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
                        height: 90.0,
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
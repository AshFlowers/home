import 'package:flutter/material.dart';

class CopingToolbox extends StatelessWidget {
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
                    icon: Icon(Icons.arrow_circle_left_outlined),
                    iconSize: 40.0,
                    color: Colors.teal[500],
                  ),

                ],
              ),
              Row(
                  children: [
                    Text(
                      'Contents',
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ]
              ),

              OutlinedButton.icon(
                icon: Icon(Icons.sticky_note_2_outlined),
                label: Text(
                  'Cancer Types Info Booklets',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),

                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cancer_types_info_booklets');
                },
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.sticky_note_2_outlined),
                label: Text(
                  'Cancer Treatments Info Booklets',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cancer_treatments_info_booklets');
                },
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.sticky_note_2_outlined),
                label: Text(
                  'Living With Cancer Info Booklets',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/living_with_cancer_info_booklets');
                },
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.sticky_note_2_outlined),
                label: Text(
                  'After Cancer Treatment Info Booklets',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/after_cancer_treatment_info_booklets');
                },
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.phone),
                label: Text(
                  'Support Contacts',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.question_mark_outlined),
                label: Text(
                  'Questions to Ask',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.chair),
                label: Text(
                  'Relaxation and Meditation',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.hiking),
                label: Text(
                  'Exercise and Cancer',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.restaurant),
                label: Text(
                  'Nutrition and Cancer',
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
                    side: MaterialStateProperty.all(BorderSide(
                        color: Colors.teal.shade500,
                        width: 1.0,
                        style: BorderStyle.solid))
                ),
                onPressed: () {},
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),

    );
  }
}
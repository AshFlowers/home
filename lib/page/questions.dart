import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home/model/basic_tile.dart';

class Questions extends StatefulWidget {
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final desc = 'Asking your health professionals questions can help you find the right support. You may want to include some of the questions below in your own list';
  final tiles = <BasicTile>[

    const BasicTile(
      title: 'Questions for your doctors',
      tiles: [
        BasicTile(title: 'Where can I get help for how I am feeling?'),
        BasicTile(title: 'How do I know if what I am feeling is a typical reaction?'),
        BasicTile(title: 'When should I think about getting some professional support?'),
        BasicTile(title: 'What are some common emotional challenges with this type of cancer?'),
        BasicTile(title: 'Will a multidisciplinary team be involved in my care? Does the MDT include a psychologist and/or social worker?'),
        BasicTile(title: 'How can I see a social worker at my treatment hospital?'),
        BasicTile(title: 'Should I see a psychiatrist?'),
        BasicTile(title: 'Could I join any clinical trials or research studies about managing the emotional impacts of cancer?'),
        BasicTile(title: 'How can I connect with other people affected by cancer?'),
        BasicTile(title: 'Which complementary therapies might help me?'),
        BasicTile(title: 'Who can I talk to about  my finances, legal matters and other practical concerns?'),
        BasicTile(title: 'Where can I get more information about the cancer, tests and treatment?'),
        BasicTile(title: 'Who can support my family or carers?'),
        BasicTile(title: 'After treatment, how do I manager fear of the cancer coming back?'),
        BasicTile(title: 'Who can I talk to if I feel worried or depressed after treatment?'),
      ]
    ),
    const BasicTile(
      title: 'Question for mental health professionals',
      tiles: [
        BasicTile(title: 'What are your qualifications and training?'),
        BasicTile(title: 'How much experience do you have supporting people affected by cancer?'),
        BasicTile(title: 'What type of therapy do you recommend for me?'),
        BasicTile(title: 'What will the sessions cost? Can the cost be reduced if I can\'t afford it?'),
        BasicTile(title: 'How long will therapy last?'),
        BasicTile(title: 'Who can I call after hours if I need immediate emotional support?'),
        BasicTile(title: 'Should I consider medicines to support my emotional health?'),
        BasicTile(title: 'Are there any apps, podcasts or online programs that might be helpful?'),
      ]
  ),

  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

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
                        'Questions To Ask',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ]
              ),

              SizedBox(height: 10.0,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        desc,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ]
              ),

              Expanded(
                child: ListView(
                  children: tiles.map(buildTile).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }

  Widget buildTile(BasicTile tile) {
    if(tile.tiles.isEmpty) {
      return ListTile(
        title: Text(
          tile.title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        //leading:
      );
    }
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      title: Text(
        tile.title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      children: tile.tiles.map((tile) => buildTile(tile)).toList(),
    );
  }
}
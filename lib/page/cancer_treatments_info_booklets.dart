import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CancerTreatments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List <List<String>> types = [
      [
        'Changes in thinking and memory',
        'https://www.cancer.org.au/assets/pdf/changes-in-thinking-and-memory'
      ],
      [
        'Chemotherapy',
        'https://www.cancer.org.au/assets/pdf/understanding-chemotherapy-booklet'
      ],
      [
        'Clinical trials and research',
        'https://www.cancer.org.au/assets/pdf/understanding-clinical-trials-and-research'
      ],
      [
        'Complementary therapies',
        'https://www.cancer.org.au/assets/pdf/understanding-complementary-therapies-booklet'
      ],
      [
        'Hair loss',
        'https://www.cancer.org.au/assets/pdf/hair-loss-fact-sheet'
      ],
      ['Massage', 'https://www.cancer.org.au/assets/pdf/massage-and-cancer'],
      [
        'Peripheral neuropathy',
        'https://www.cancer.org.au/assets/pdf/understanding-peripheral-neuropathy'
      ],
    ];

    final desc =
        'Gathering information about cancer and its treatment can help you make '
        'informed decisions. Below are info booklets on various cancer treatments';

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
                        'Cancer Treatments',
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
                        'Find out what to expect',
                        style: Theme.of(context).textTheme.titleSmall,
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
              SizedBox(height: 10.0,),
              Expanded(
                child: ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(types[index][1]);
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch' + 'url');
                        }
                      },

                      child: Container(
                        height: 90,
                        child: Card(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      types[index][0],
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05,),

                                  Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.teal[500],
                                  ),

                                ],
                              )
                          ),
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

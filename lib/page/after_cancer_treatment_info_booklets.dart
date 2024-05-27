import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AfterCancerTreatment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    List <List<String>> types = [
      ['Arm and shoulder exercises after surgery','https://www.cancer.org.au/assets/pdf/arm-and-shoulder-exercises-after-surgery'],
      ['Breast prostheses and reconstruction','https://www.cancer.org.au/assets/pdf/breast-prostheses-and-reconstruction'],
      ['Facing end of life','https://www.cancer.org.au/assets/pdf/facing-end-of-life'],
      ['Living well after cancer','https://www.cancer.org.au/assets/pdf/living-well-after-cancer-booklet'],
      ['On the road to recovery','https://www.cancer.org.au/assets/pdf/on-the-road-to-recovery-english'],
      ['Sexuality, intimacy and cancer','https://www.cancer.org.au/assets/pdf/sexuality-intimacy-and-cancer-booklet'],
      ['Understanding grief','https://www.cancer.org.au/assets/pdf/understanding-grief-booklet'],
      ['Understanding lymphoedema','https://www.cancer.org.au/assets/pdf/understanding-lymphoedema'],
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
                        'After Cancer Treatment',
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
                                      style: Theme.of(context).textTheme.titleMedium,
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
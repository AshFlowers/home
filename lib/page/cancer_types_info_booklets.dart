import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/my_flutter_app_icons.dart';

class CancerTypes extends StatelessWidget {
  final String desc =
      'Gathering information about cancer and its treatment can help you make '
      'informed decisions. Below are info booklets on various types'
  ;

  final List <List<String>> types = [
    ['Anal cancer','https://www.cancer.org.au/assets/pdf/understanding-anal-cancer'],
    ['Bladder','https://www.cancer.org.au/assets/pdf/understanding-bladder-cancer-booklet'],
    ['Bowel','https://www.cancer.org.au/assets/pdf/understanding-bowel-cancer-booklet'],
    ['Bone - primary','https://www.cancer.org.au/assets/pdf/understanding-primary-bone-cancer'],
    ['Bone - secondary','https://www.cancer.org.au/assets/pdf/understanding-secondary-bone-cancer'],
    ['Brain','https://www.cancer.org.au/assets/pdf/understanding-brain-tumour-booklet'],
    ['Breast','https://www.cancer.org.au/assets/pdf/understanding-breast-cancer-booklet'],
    ['Cervical','https://www.cancer.org.au/assets/pdf/understanding-cervical-cancer-booklet'],
    ['Head and Neck','https://www.cancer.org.au/assets/pdf/understanding-head-and-neck-cancer-booklet'],
    ['Kidney','https://www.cancer.org.au/assets/pdf/understanding-kidney-cancer-booklet'],
    ['Liver','https://www.cancer.org.au/assets/pdf/understanding-liver-cancer-booklet'],
    ['Lung','https://www.cancer.org.au/assets/pdf/understanding-lung-cancer-booklet-2022'],
    ['Melanoma','https://www.cancer.org.au/assets/pdf/understanding-melanoma-cancer-booklet'],
    ['Mesothelioma','https://www.cancer.org.au/assets/pdf/understanding-mesothelioma-cancer-booklet'],
    ['Myeloma','https://www.cancer.org.au/assets/pdf/understanding-myeloma-booklet'],
    ['Ovarian','https://www.cancer.org.au/assets/pdf/understanding-ovarian-cancer-booklet'],
    ['Pancreatic','https://www.cancer.org.au/assets/pdf/understanding-pancreatic-cancer-booklet'],
    ['Prostate','https://www.cancer.org.au/assets/pdf/understanding-prostate-cancer-booklet'],
    ['Skin','https://www.cancer.org.au/assets/pdf/understanding-skin-cancer-booklet'],
    ['Stomach and Oesophagial','https://www.cancer.org.au/assets/pdf/understanding-stomach-and-oesophageal-cancer-booklet'],
    ['Testicular','https://www.cancer.org.au/assets/pdf/understanding-testicular-cancer-booklet'],
    ['Thyroid','https://www.cancer.org.au/assets/pdf/understanding-thyroid-cancer-booklet'],
    ['Unknown Primary','https://www.cancer.org.au/assets/pdf/understanding-cancer-of-unknown-primary-booklet'],
    ['Uterine','https://www.cancer.org.au/assets/pdf/understanding-uterus-cancer-booklet'],
    ['Vaginal','https://www.cancer.org.au/assets/pdf/understanding-vaginal-cancers-booklet']
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              SizedBox(height: height/40,),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Cancer Types',
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


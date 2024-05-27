import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/my_flutter_app_icons.dart';

class LivingWithCancer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final String desc =
        'Gathering information about cancer and its various life hurdles '
        'can help you make informed decisions. Below are info booklets on '
        'common issues';

    List <List<String>> types = [
      ['Cancer and your finances','https://www.cancer.org.au/assets/pdf/cancer-and-your-finances-booklet'],
      ['Cancer care and your rights','https://www.cancer.org.au/assets/pdf/cancer-care-and-your-rights-booklet'],
      ['Cancer in the school community','https://www.cancer.org.au/assets/pdf/cancer-in-the-school-community'],
      ['Cancer support groups','https://www.cancer.org.au/assets/pdf/cancer-support-groups'],
      ['Cancer, work and you','https://www.cancer.org.au/assets/pdf/cancer-work-and-you-booklet'],
      ['Caring for someone with cancer','https://www.cancer.org.au/assets/pdf/caring-for-someone-with-cancer-booklet'],
      ['Living with advanced cancer (e-book)','https://www.cancer.org.au/assets/epub/living-with-advanced-cancer-ebook'],
      ['Emotions and cancer','https://www.cancer.org.au/assets/pdf/emotions-and-cancer-booklet'],
      ['Fertility and cancer','https://www.cancer.org.au/assets/pdf/fertility-and-cancer'],
      ['Understanding cancer pain','https://www.cancer.org.au/assets/pdf/understanding-cancer-pain-booklet'],
      ['Understanding rare and less common cancers','https://www.cancer.org.au/assets/pdf/understanding-rare-and-less-common-cancers'],
      ['Understanding secondary liver cancer','https://www.cancer.org.au/assets/pdf/understanding-secondary-liver-cancer'],
      ['Talking to kids about cancer','https://www.cancer.org.au/assets/pdf/talking-to-kids-about-cancer-a-guide-for-people-with-cancer-their-families-and-friends'],
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
                        'Living with cancer',
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
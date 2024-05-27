import 'package:flutter/material.dart';
import 'package:home/model/advanced_tile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/my_flutter_app_icons.dart';

class SupportContacts extends StatefulWidget {
  @override
  State<SupportContacts> createState() => _SupportContactsState();
}

class _SupportContactsState extends State<SupportContacts> {
  final String desc =
      'You can find many useful resources and online but not all are reliable. '
      'Below are some quality services, and sources of information and support';

  final tiles = <AdvancedTile>[

    const AdvancedTile(
      title: 'Australian Cancer Trials',
        tiles: [
          AdvancedTile(
            title: 'Find A Cancer Trial',
            icon: Icons.find_in_page_outlined,
            url: 'https://www.australiancancertrials.gov.au',
          ),
        ]
    ),

    const AdvancedTile(
      title: 'Australian Psychological Society',
        tiles: [
          AdvancedTile(
            title: 'Find A Psychologist',
            icon: Icons.find_in_page_outlined,
            url: 'https://psychology.org.au/find-a-psychologist',
          ),
        ]
    ),

    const AdvancedTile(
      title: 'Beyond Blue',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 1300224636',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.beyondblue.org.au',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Breast Cancer Network Australia',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 1800500258',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.bcna.org.au/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Cancer Australia',
      tiles: [
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.canceraustralia.gov.au/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Cancer Council',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 131120',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.cancercouncil.com.au',
        ),
        AdvancedTile(
          title: 'Online Community',
          icon: Icons.people,
          url: 'https://onlinecommunity.cancercouncil.com.au/',
        ),
        AdvancedTile(
          title: 'Podcast',
          icon: Icons.podcasts,
          url: 'https://www.cancercouncil.com.au/podcasts/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Canteen (for young people aged 12-25 affected by cancer)',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 1800 835 932',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.canteen.org.au/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Carer Gateway',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 1800422737',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.carergateway.gov.au/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Carers Australia',
      tiles: [
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.carersaustralia.com.au/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Department of Health',
      tiles: [
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.health.gov.au/',
        )
      ]
    ),

    const AdvancedTile(
      title: 'eviQ Cancer Treatments Online',
      tiles: [
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.eviq.org.au/patients-and-carers',
        )
      ]
    ),

    const AdvancedTile(
      title: 'Guides to Best Cancer Care',
        tiles: [
          AdvancedTile(
            title: 'Website',
            icon: Icons.web,
            url: 'https://www.cancer.org.au/cancercareguides',
          )
        ]
    ),

    const AdvancedTile(
      title: 'Healthdirect Australia',
      tiles: [
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.healthdirect.gov.au/',
        )
      ]
    ),

    const AdvancedTile(
      title: 'International Websites',
      tiles: [
        AdvancedTile(
          title: 'American Cancer Society',
          icon: Icons.web,
          url: 'https://www.cancer.org/',
        ),
        AdvancedTile(
          title: 'Cancer Research UK',
          icon: Icons.web,
          url: 'https://www.cancerresearchuk.org/',
        ),
        AdvancedTile(
          title: 'CaringBridge',
          icon: Icons.web,
          url: 'https://www.caringbridge.org/',
        ),
        AdvancedTile(
          title: 'Macmillan Cancer Support (UK)',
          icon: Icons.web,
          url: 'https://www.macmillan.org.uk/',
        ),
        AdvancedTile(
          title: 'Ottawa Hospital Research Institute Patient Decision Aids (Canada)',
          icon: Icons.web,
          url: 'https://decisionaid.ohri.ca/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Kids Helpline (for young people aged 5-25)',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 1800551800',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://kidshelpline.com.au/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Lifeline',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 131114',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://www.lifeline.org.au/',
        ),
      ]
    ),

    const AdvancedTile(
      title: 'Look Good Feel Better',
      tiles: [
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://lgfb.org.au/',
        )
      ]
    ),

    const AdvancedTile(
      title: 'MensLine Australia',
      tiles: [
        AdvancedTile(
          title: 'Phone',
          icon: Icons.phone,
          url: 'tel: 1300789978',
        ),
        AdvancedTile(
          title: 'Website',
          icon: Icons.web,
          url: 'https://mensline.org.au/',
        ),
      ]
    ),

    const AdvancedTile(
        title: 'MindSpot',
        tiles: [
          AdvancedTile(
            title: 'Website',
            icon: Icons.web,
            url: 'https://www.mindspot.org.au/',
          )
        ]
    ),

    const AdvancedTile(
        title: 'Moodgym',
        tiles: [
          AdvancedTile(
            title: 'Website',
            icon: Icons.web,
            url: 'https://www.moodgym.com.au/',
          )
        ]
    ),

    const AdvancedTile(
        title: 'Prostate Cancer Foundation of Australia',
        tiles: [
          AdvancedTile(
            title: 'Website',
            icon: Icons.web,
            url: 'https://www.prostate.org.au/',
          )
        ]
    ),

    const AdvancedTile(
        title: 'Relationships Australia',
        tiles: [
          AdvancedTile(
            title: 'Website',
            icon: Icons.web,
            url: 'https://www.relationships.org.au/',
          )
        ]
    ),

    const AdvancedTile(
        title: 'Services Australia (including Centrelink and Medicare)',
        tiles: [
          AdvancedTile(
            title: 'Website',
            icon: Icons.web,
            url: 'https://www.servicesaustralia.gov.au/',
          )
        ]
    ),

    const AdvancedTile(
        title: 'This Way Up',
        tiles: [
          AdvancedTile(
            title: 'Website',
            icon: Icons.web,
            url: 'https://thiswayup.org.au/',
          )
        ]
    ),
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
                          'Support & Services',
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
                SizedBox(height: 10.0,),

                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 65.0),
                    children: tiles.map(buildTile).toList(),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }

  Widget buildTile(AdvancedTile tile) {
    if(tile.tiles.isEmpty) {
      return ListTile(
        title: Text(
          tile.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        leading: Icon(
          tile.icon,
          color: Colors.teal[500],
        ),

        onTap: () async {
          final Uri url = Uri.parse(tile.url);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch' + 'url');
          }
        },
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

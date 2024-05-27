import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:home/page/exercise_select.dart';
import 'package:home/page/journal_entry.dart';
import 'package:home/page/living_with_cancer_info_booklets.dart';
import 'package:home/page/support_contacts.dart';
import 'package:home/page/wellbeing_quiz.dart';
import 'package:home/theme_provider.dart';
import 'package:home/themes.dart';
import 'package:home/model/wellbeing_scores.dart';
import 'package:home/model/wellbeing_chart.dart';
import 'package:home/page/coping_toolbox.dart';
import 'package:flutter/services.dart';
import 'package:home/page/cancer_types_info_booklets.dart';
import 'package:home/page/cancer_treatments_info_booklets.dart';
import 'package:home/page/after_cancer_treatment_info_booklets.dart';
import 'package:home/page/questions.dart';
import 'package:home/page/relaxation.dart';
import 'package:home/page/exercise.dart';
import 'package:home/page/accessibility_settings.dart';
import 'package:provider/provider.dart';
import 'package:home/page/calendar.dart';
import 'package:home/page/journal.dart';
import 'package:home/db/score_storage.dart';
import '../db/entry_storage.dart';
import 'journal_entry_edit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final scoreStorage = ScoreStorage();
  final entryStorage = EntryStorage();

  File scoresFile = await scoreStorage.scoresFile;
  bool scoreFileExists = await scoresFile.exists();

  File entriesFile = await entryStorage.entriesFile;
  bool entriesFileExists = await entriesFile.exists();

  if(!scoreFileExists) {
    await scoresFile.create();
  }

  if(!entriesFileExists) {
    await entriesFile.create();
  }

  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: HandInHand(),
    ),
  );
}

class HandInHand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          routes: {
            '/': (context) => MyHomePage(),
            '/calendar': (context) => Calendar(),
            '/journal': (context) => Journal(),
            '/journal_entry': (context) => JournalEntry(),
            '/journal_entry_edit': (context) => JournalEntryEdit(),
            '/accessibility_settings': (context) => AccessibilitySettings(),
            '/wellbeing_quiz': (context) => WellbeingQuiz(),
            '/coping_toolbox': (context) => CopingToolbox(),
            '/cancer_types_info_booklets': (context) => CancerTypes(),
            '/cancer_treatments_info_booklets': (context) => CancerTreatments(),
            '/living_with_cancer_info_booklets': (context) => LivingWithCancer(),
            '/after_cancer_treatment_info_booklets': (context) => AfterCancerTreatment(),
            '/support_contacts': (context) => SupportContacts(),
            '/questions': (context) => Questions(),
            '/relaxation': (context) => Relaxation(),
            '/exercise': (context) => Exercise(),
            '/exercise_select': (context) => ExerciseSelect(),
          },

          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: provider.themeMode,
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  final scoreStorage = ScoreStorage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomNavIndex = 0;
  List<String> months = [
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
  ];
//dummy data
  //final List<WellbeingScore> scores = [];

  final List<WellbeingScore> scores = [
    WellbeingScore(
      month: "JAN",
      score: 1.5,
    ),
    WellbeingScore(
      month: "FEB",
      score: 2.5,
    ),
    WellbeingScore(
      month: "MAR",
      score: 3.5,
    ),
    WellbeingScore(
      month: "APR",
      score: 4.5,
    ),
  ];

  double score = 0;


  @override
  void initState() {
    super.initState();
    widget.scoreStorage.read().then((value) {
      try {
        setState(() {
          for(var score in jsonDecode(value)) {
            scores.add(WellbeingScore.fromMap(score));
          }
        });
      } on FormatException catch(e) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Consumer<ThemeProvider>(
                    builder: (context, provider, child) {
                      return IconButton(
                        iconSize: 40.0,
                        icon: Icon(Icons.settings_outlined),
                        onPressed: () {
                          Navigator.pushNamed(
                              context,
                              '/accessibility_settings',
                              arguments: {'currentTheme': provider}
                          );
                        },
                      );
                    }
                ),
                SizedBox(width: width * 0.05),
              ],
            ),
            Row(
                children: [
                  SizedBox(width: width * 0.10),
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ]
            ),

            Material(
              elevation: 10.0,
              child: Container(
                child:
                WellbeingChart(
                    data: scores),
              ),
            ),


            ElevatedButton(
              onPressed: () async {
                final now = DateTime.now();
                Map <String,double> scoreMap = {};

                try {
                  scoreMap = await Navigator.pushNamed(
                      context, '/wellbeing_quiz'
                  ) as Map <String, double>;

                  final scoreObj = WellbeingScore(
                    month: months[now.month - 1],
                    score: scoreMap['score'],
                  );

                  setState(() {
                    scores.add(scoreObj);
                    widget.scoreStorage.write(jsonEncode(scores));
                  });
                } catch(e) {
                  return;
                }
              },

              child: Text(
                'Take your monthly wellbeing quiz',
                style: TextStyle(
                    color: Theme.of(context).highlightColor
                ),
              ),

            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.10),
              child: Text(
                'The coping toolbox presents a list of support tools that will assist you emotionally on your cancer journey',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
            ),

            Icon(
              Icons.arrow_downward,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/coping_toolbox');
                },

                child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              'Your Coping Toolbox',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Icon(
                            Icons.business_center,
                          ),

                        ],
                      )),
                ),
              ),
            ),
            SizedBox(height: 10.0),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: (index) {
          setState(() => bottomNavIndex = index);
          if (index == 1) {
            Navigator.pushNamed(context, '/journal');
            bottomNavIndex = 0;
          }
          if (index == 2) {
            Navigator.pushNamed(context, '/calendar');
            bottomNavIndex = 0;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.grey[300],
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Journal',
            backgroundColor: Colors.grey[300],
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
            backgroundColor: Colors.grey[300],
          ),

        ],
        elevation: 15.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 40),
        unselectedIconTheme: IconThemeData(size: 25),
      ),
    );
  }
}






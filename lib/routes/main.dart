import 'package:flutter/material.dart';
import 'package:home/wellbeing_scores.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:home/wellbeing_chart.dart';
import 'package:home/routes/coping_toolbox.dart';
import 'package:flutter/services.dart';
import 'cancer_types_info_booklets.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'HomePage',
      routes: {
        '/' : (context) => MyHomePage(),
        '/coping_toolbox' : (context) => CopingToolbox(),
        '/cancer_types_info_booklets' : (context) => CancerTypes(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int bottomNavIndex = 0;

  final List<WellbeingScore> data = [
    WellbeingScore(
      month: "JAN",
      score: 1.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "FEB",
      score: 1.5,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "MAR",
      score: 2.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "APR",
      score: 2.5,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "MAY",
      score: 3.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "JUN",
      score: 3.5,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "JUL",
      score: 4.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "AUG",
      score: 3.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "SEP",
      score: 4.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "OCT",
      score: 3.5,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "NOV",
      score: 4.5,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
    WellbeingScore(
      month: "DEC",
      score: 5.0,
      barColor: charts.ColorUtil.fromDartColor(Colors.teal.shade500),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600 ? true : false;

    if(isMobile) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 40.0,
                  color: Colors.teal[500],
                  icon: Icon(Icons.notifications),
                  onPressed: () { print("notifications pressed");},
                ),
                IconButton(
                  iconSize: 40.0,
                  color: Colors.teal[500],
                  icon: Icon(Icons.settings_outlined),
                  onPressed: () { print("settings pressed");},
                ),
                SizedBox(width: width * 0.05),
              ],
            ),
            Row(
              children: [
                SizedBox(width: width * 0.10),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ]
            ),

            Material(
              elevation: 10.0,
              child: Container(
                child:
                WellbeingChart(data: data),
              ),
            ),


            ElevatedButton(
              onPressed: () { print("take quiz pressed");},
              child: Text(
                'Take your monthly wellbeing quiz',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.teal.shade500),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Text(
                  'The coping toolbox presents a list of support tools that will assist you emotionally on your cancer journey.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    letterSpacing: 0.5,
                  ),
                ),
            ),
            Icon(Icons.arrow_downward),
            OutlinedButton.icon(
                icon: Icon(Icons.business_center),
                label: Text(
                  'Your Coping Toolbox',
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
                  print("coping toolbox pressed");
                  Navigator.pushNamed(context, '/coping_toolbox');
                },
            ),
            SizedBox(height: 10.0),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: (index) => setState(() => bottomNavIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: Colors.grey[100],
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Journal',
              backgroundColor: Colors.grey[100],
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
              backgroundColor: Colors.grey[100],
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_outlined),
              label: 'FAQ',
              backgroundColor: Colors.grey[100],
          ),
        ],
        elevation: 15.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.teal[500],
        unselectedItemColor: Colors.grey[800],
        selectedIconTheme: IconThemeData(size: 40),
        unselectedIconTheme: IconThemeData(size: 25),
      ),
    );
  }
}




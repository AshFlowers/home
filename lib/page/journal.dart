import 'package:flutter/material.dart';
import 'package:home/themes.dart';

class Journal extends StatefulWidget {

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  int _bottomNavIndex = 1;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
          if (index == 0) {
            Navigator.pop(context);
          }
          if (index == 2) {
            Navigator.popAndPushNamed(context, '/calendar');
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () async {
              Navigator.pushNamed(context, '/journal_entry');
            },

            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            tooltip: "Add journal entry",
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        ]
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.075),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height/15,),

              Row(
                children: [
                  Text(
                    'My Journal',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),


            ],
              ),
          ),
        ),
      );
  }
}
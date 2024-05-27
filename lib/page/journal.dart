import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home/themes.dart';
import '../db/entry_storage.dart';
import '../model/entry.dart';

class Journal extends StatefulWidget {
  final entryStorage = EntryStorage();
  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  int _bottomNavIndex = 1;
  final List<Entry> entries = [];

  @override
  void initState() {
    super.initState();
    widget.entryStorage.read().then((value) {
      try {
        setState(() {
          for (var entry in jsonDecode(value)) {
            entries.add(Entry.fromMap(entry));
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
            Navigator.pushReplacementNamed(context, '/calendar');
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
        selectedItemColor: AppColors.primary,
        selectedIconTheme: IconThemeData(size: 40),
        unselectedIconTheme: IconThemeData(size: 25),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () async {
              try {
                final entryMap = await Navigator.pushNamed(
                    context, '/journal_entry'
                ) as Map<String, String>;

                final entryObj = Entry(
                  title: entryMap['title'],
                  entry: entryMap['entry'],
                );

                setState(() {
                  entries.add(entryObj);
                  widget.entryStorage.write(jsonEncode(entries));
                });
              } catch(e) {
                return;
              }
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

              SizedBox(height: height/15,),

              Expanded(
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: ()  async {
                        try {
                          final entryMap = await Navigator.pushNamed(context,
                              '/journal_entry_edit',
                              arguments: {
                                'index': index,
                                'entries': entries,
                              }
                          ) as Map<String, dynamic>;

                          setState(() {
                            entries[index].title = entryMap['title'];
                            entries[index].entry = entryMap['entry'];
                            widget.entryStorage.write(jsonEncode(entries));
                          });
                        } catch(e) {
                          return;
                        }
                      },

                      child: Container(
                        height: 90,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(
                              color: AppColors.primary,
                            ),
                          ),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      entries[index].title.toString(),
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05,),

                                  Icon(
                                    Icons.create_outlined,
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
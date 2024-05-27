import 'package:flutter/material.dart';
import 'package:home/themes.dart';

class JournalEntry extends StatefulWidget {

  @override
  State<JournalEntry> createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(
                    children: [
                      TextField(),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height/20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: height/20,
                    width: width/4,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: Theme.of(context).highlightColor
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                      height: height/20,
                      width: width/4,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: Theme.of(context).highlightColor
                          ),
                        )
                    ),
                  ),
                ],
              ),

              SizedBox(height: height/20,),

            ],


          ),
        ),
      ),
    );
  }
}
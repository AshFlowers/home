import 'package:flutter/material.dart';
import 'package:home/themes.dart';

class JournalEntryEdit extends StatefulWidget {

  @override
  State<JournalEntryEdit> createState() => _JournalEntryEditState();
}

class _JournalEntryEditState extends State<JournalEntryEdit> {
  TextEditingController titleController = TextEditingController();
  TextEditingController entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    titleController.text = arguments['entries'][arguments['index']].title;
    entryController.text = arguments['entries'][arguments['index']].entry;



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

              SizedBox(height: height/40,),

              Row(
                  children: [
                    Flexible(
                      child: Text(
                        'In your Journal, try to answer these questions:',
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
                        'What/Who made you think and feel positive this week?\n'
                        'What is something that made you grateful this week?\n'
                        'Who supported you best this week?\n'
                        'What are some of the goals you would like to achieve this week?\n',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ]
              ),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            TextField(
                              controller: entryController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              maxLines: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height/20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height/20,
                    width: width/4,
                    child: ElevatedButton(
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pop(context);

                        },
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
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final title = await titleController.text;
                          final entry = await entryController.text;
                          Navigator.pop(context, {
                            'title': title,
                            'entry': entry,
                          });


                        },
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
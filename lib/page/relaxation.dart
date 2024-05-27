import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/my_flutter_app_icons.dart';

class Relaxation extends StatefulWidget {
  @override
  State<Relaxation> createState() => _ExerciseState();
}

class _ExerciseState extends State<Relaxation> {
  List videos = [
    'https://youtu.be/77ZozI0rw7w?si=loX3o2wpAmcZ6TCr',
    'https://www.youtube.com/watch?v=sF0berGrlho',
    'https://www.youtube.com/watch?v=5U088PJhkxs',
    'https://www.youtube.com/watch?v=Jua4ZYq97po',
    'https://www.youtube.com/watch?v=YjMed9F2Ng4',
    'https://www.youtube.com/watch?v=6dwPaEzO0AE',
  ];

  Key _refreshKey = UniqueKey();
  String videoUrl = 'https://youtu.be/77ZozI0rw7w?si=loX3o2wpAmcZ6TCr';
  int activeIndex = 0;
  List<bool> _selections = [true, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final desc =
        'These therapies can help reduce stress, anxiety and fatigue, and '
        'improve quality of life';

    return Scaffold(
      body: SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            key: _refreshKey,
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.075),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [

                      IconButton(
                        onPressed: () {
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                          ]);
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
                          'Relaxation and Meditation',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ToggleButtons(
                          direction: Axis.vertical,
                          verticalDirection: VerticalDirection.down,
                          isSelected: _selections,
                          onPressed: (int index) {
                            setVideo(index);
                          },
                          children: [
                            Text('Relaxation'),
                            Text('Yoga'),
                            Text('Tai chi'),
                            Text('Qigong'),
                            Text('Meditation'),
                            Text('Mindfullness'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  player,
                  SizedBox(height: height/20,)
                ],
              ),
            );
          }

        ),
      ),
    );
  }

  void setVideo(int index) {
    if(activeIndex == index) {
      return;
    }

    setState(() {
      _refreshKey = UniqueKey();
      videoUrl = videos[index];
      _selections[activeIndex] = false;
      _selections[index] = true;
      activeIndex = index;
    });
  }

}

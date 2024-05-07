import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gradproj/screens/sports/rest.dart';
import 'package:gradproj/screens/sports/timer_trainings.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/text.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../widgets/vedio.dart';
import '../main_screens/homepage.dart';
import '../main_screens/settings.dart';


class CounterTrainings extends StatefulWidget{
  final String link;
  final String training_name;
  const CounterTrainings({Key? key, required this.link, required this.training_name}) : super(key: key);
  @override
  State<CounterTrainings> createState() => _CounterTrainingsState();
}

class _CounterTrainingsState extends State<CounterTrainings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextTitle(
            text: widget.training_name,
            textcolor: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB( 20, 150, 20,100 ),
                    height: 600,
                    width: 700,
                    child: VideoPlayerWidget(link: widget.link,)),

                     CalculateButton(
                      title: 'Done',
                      onTap: () {
                        //backend action (save training name in database & display it and it's date in sports_report page
                        Navigator.pop(context);
                      },
                      buttonbackcolor: kButtonColor,
                      buttontextcolor: Colors.white,
                    ),
              ]),

        ));
  }
}
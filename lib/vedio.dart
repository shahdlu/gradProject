import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  YoutubePlayerController? _controller;
  final String url = 'https://youtu.be/2QKSW30Q9ag?si=sB02EZaCjyFtMO3l';
  late String id;
  @override
  void initState() {
    super.initState();
    id = YoutubePlayer.convertUrlToId(url)!;
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.cyan,
        progressColors: ProgressBarColors(
          playedColor: Colors.cyan,
          handleColor: Colors.cyanAccent,
        ),

      ),
      builder: (BuildContext , player ) {
        return Scaffold(
          body: player,
        );
      },);

  }
}
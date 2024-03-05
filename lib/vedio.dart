import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
   late VideoPlayerController _controller;
   late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {

    // Initialize the video player controller
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
        _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the video player controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
              child: VideoPlayer(
                _controller,
              ),
            )));
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },


      ),

      floatingActionButton:
      Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            if(_controller.value.isPlaying){
              _controller.pause();
            }else{
              _controller.play();
            }
          });
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      )),
    );
}
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPlayerWidget(),
    );
  }
}
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class LiveYouTubeVideo extends StatefulWidget {
  @override
  _LiveYouTubeVideoState createState() => _LiveYouTubeVideoState();
}

class _LiveYouTubeVideoState extends State<LiveYouTubeVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '4nQ2LT04reQ', // e.g. '5qap5aO4i9A'
      flags: YoutubePlayerFlags(
        isLive: true,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}

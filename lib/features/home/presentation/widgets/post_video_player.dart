import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPost extends StatefulWidget {
  final String url;
  const VideoPost({super.key, required this.url});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url),)
      ..initialize().then((_) {
        setState(() {}); // refresh when ready
        _controller.play(); 
        // auto-play
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

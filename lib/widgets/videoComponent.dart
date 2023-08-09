import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class VideoComponent extends StatefulWidget {
  const VideoComponent({Key? key}) : super(key: key);

  @override
  State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
    late final PodPlayerController controller;


  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller),
    );
  }
}
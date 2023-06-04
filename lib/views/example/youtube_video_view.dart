import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class YoutubeVideoView extends StatelessWidget {
  const YoutubeVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube Video"),
      ),
      body: Center(
        child: YoutubeVideoPlayer(
          code: "Fa1RKBhVnnE",
        ),
      ),
    );
  }
}

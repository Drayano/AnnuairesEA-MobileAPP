import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerEmbed extends StatelessWidget {
  final String videoEntreprise;

  const YoutubePlayerEmbed({
    Key? key,
    required this.videoEntreprise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoEntreprise)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return YoutubePlayer(
      controller: controller,
      liveUIColor: Colors.amber,
    );
  }
}

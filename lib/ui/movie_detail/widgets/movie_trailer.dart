import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatefulWidget {
  final String videoId;
  const MovieTrailer({super.key, required this.videoId});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late YoutubePlayerController _controller;
  var _isPlayerVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trailer',
          style: AppTextStyles.boldMedium,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            clipBehavior: Clip.hardEdge,
            child: Visibility(
              visible: _isPlayerVisible,
              replacement: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPlayerVisible = true;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      YoutubePlayer.getThumbnail(videoId: widget.videoId, quality: ThumbnailQuality.medium),
                      fit: BoxFit.cover,
                    ),
                    Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 64,
                    ),
                  ],
                ),
              ),
              child: YoutubePlayer(controller: _controller),
            ),
          ),
        ),
      ],
    );
  }
}

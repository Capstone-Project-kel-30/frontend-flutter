import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/themes/app_theme.dart';
import '../widgets/vertical_space.dart';
import 'widgets/filter_button.dart';
import 'widgets/video_content_card.dart';

class VideoContentPage extends StatefulWidget {
  const VideoContentPage({Key? key}) : super(key: key);

  @override
  State<VideoContentPage> createState() => _VideoContentPageState();
}

class _VideoContentPageState extends State<VideoContentPage> {
  late YoutubePlayerController _videoController;
  final String url = 'https://www.youtube.com/watch?v=B-_GP-YKk3w';

  @override
  void dispose() {
    _videoController = YoutubePlayerController(initialVideoId: '');
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Content')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterButton(
                text: 'Sort',
                onTap: () {},
              ),
              const VerticalSpace(height: 10),
              Expanded(
                child: VideoContentCard(
                  videoCategory: 'Body Building',
                  title: 'Lorem Ipsum Dorem',
                  duration: '24:00',
                  description:
                      'In adipisicing irure aliqua anim incididunt et veniam consequat laborum ea eiusmod. Quis consequat quis occaecat officia ullamco cillum qui. Officia qui nulla excepteur esse. Excepteur incididunt proident Lorem qui dolor aute dolor eiusmod tempor Lorem. Cupidatat ex do excepteur do consectetur ea mollit ullamco consequat id. Ea ad ullamco quis exercitation mollit laborum fugiat.',
                  onTap: () {
                    _videoController = YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
                    );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: _videoController,
                            showVideoProgressIndicator: true,
                            progressColors: const ProgressBarColors(
                              playedColor: kPrimaryColor,
                              handleColor: kDarkerPrimaryColor,
                            ),
                            progressIndicatorColor: kPrimaryColor,
                          ),
                          builder: (_, p1) {
                            return Dialog(
                              insetPadding: EdgeInsets.zero,
                              child: p1,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

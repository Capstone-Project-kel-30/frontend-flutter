import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/vertical_space.dart';
import 'widgets/filter_button.dart';
import 'widgets/video_content_card.dart';

class VideoContentPage extends StatelessWidget {
  const VideoContentPage({Key? key}) : super(key: key);

  void launchURL() async {
    const url = 'https://www.youtube.com/watch?v=B-_GP-YKk3w';
    var uri = Uri.parse(url);
    debugPrint(uri.toString());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
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
                    launchURL();
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

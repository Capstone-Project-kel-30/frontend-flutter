import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../widgets/vertical_space.dart';
import 'widgets/image_carousel.dart';
import 'widgets/image_container.dart';
import 'widgets/image_container_title.dart';
import 'widgets/membership_info.dart';
import 'widgets/welcome_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgList = [
    'assets/images/dummy1.png',
    'assets/images/dummy2.jpg',
    'assets/images/dummy3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const WelcomeBar(username: 'Dadang Konelo'),
          const VerticalSpace(height: 15),
          ImageCarousel(
            imgList: imgList,
          ),
          const VerticalSpace(height: 25),
          const MembershipInfo(),
          const VerticalSpace(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageContainerTitle(
                moreThan5: true,
                title: 'Health tips for you',
                onTap: () {
                  context.router.push(const NewsletterRoute());
                },
              ),
              const VerticalSpace(height: 10),
              ImageContainer(
                imgList: imgList,
                title: 'aaaaaaaaaaaaaaa',
                video: false,
                onTap: () {
                  context.router.push(const NewsletterRoute());
                },
              ),
            ],
          ),
          const VerticalSpace(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageContainerTitle(
                moreThan5: false,
                title: 'Workout From Home',
                onTap: () {
                  context.router.push(const VideoContentRoute());
                },
              ),
              const VerticalSpace(height: 10),
              ImageContainer(
                imgList: imgList,
                title: 'aaaaaaaaaaaaaaaaaa',
                video: true,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          insetPadding: EdgeInsets.zero,
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          content: AspectRatio(
                            aspectRatio: 1,
                            child: Text('Putar Video'),
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

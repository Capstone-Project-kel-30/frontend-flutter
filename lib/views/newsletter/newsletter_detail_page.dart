import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:share_plus/share_plus.dart';
import 'package:workout_zone/views/widgets/custom_network_image.dart';

import '../../utils/themes/app_theme.dart';
import '../widgets/custom_sliver_persistent_header_delegate.dart';
import '../widgets/vertical_space.dart';
import 'widgets/like_button.dart';
import 'widgets/newsletter_date.dart';
import 'widgets/newsletter_title.dart';

class NewsletterDetailPage extends StatelessWidget {
  const NewsletterDetailPage({
    Key? key,
    required this.link,
    required this.newsletterTitle,
    required this.date,
    required this.content,
  }) : super(key: key);
  final String link;
  final String newsletterTitle, date, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              bool isCollapsed = constraints.scrollOffset > 200;
              return SliverAppBar(
                pinned: true,
                floating: true,
                centerTitle: false,
                title: isCollapsed ? Text(newsletterTitle) : null,
                expandedHeight: 260,
                flexibleSpace: FlexibleSpaceBar(
                  background: CustomNetworkImage(link: link),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share_outlined),
                    color: kPrimaryColor,
                    onPressed: () async {
                      await Share.share(
                        'Share $newsletterTitle to your friends!',
                      );
                    },
                  )
                ],
              );
            },
          ),
          SliverPersistentHeader(
            delegate: CustomSPHD(),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewsletterTitle(title: newsletterTitle),
                      const VerticalSpace(height: 10),
                      NewsletterDate(date: date),
                      const VerticalSpace(height: 10),
                      HtmlWidget(content),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 80),
                          child: LikeButton(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "We glad you like the newsletter",
                                    ),
                                  ),
                                );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
